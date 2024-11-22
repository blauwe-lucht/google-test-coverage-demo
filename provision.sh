#!/bin/bash

set -euo pipefail

echo "Updating packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing development tools..."
sudo apt install -y build-essential cmake git curl

echo "Installing Google Test..."
sudo apt install -y libgtest-dev
cd /usr/src/googletest
sudo cmake .
sudo make
sudo make install
cd -

echo "Installing code coverage tools..."
sudo apt install -y lcov

echo "Installing additional utilities..."
sudo apt install -y vim tree

echo "Setting up project directory..."
PROJECT_DIR="/home/vagrant/gtest_coverage_poc"
mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests" "$PROJECT_DIR/build"
chown -R vagrant:vagrant "$PROJECT_DIR"

echo "Environment setup complete."
