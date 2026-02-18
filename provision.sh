#!/bin/bash

set -euo pipefail

echo "Updating packages..."
DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y

echo "Installing development tools..."
apt-get install -y build-essential cmake git curl

echo "Installing Google Test..."
apt-get install -y libgtest-dev
cd /usr/src/googletest
cmake .
make
make install
cd -

echo "Installing code coverage tools..."
apt-get install -y lcov

echo "Installing additional utilities..."
apt-get install -y vim tree

echo "Setting up project directory..."
PROJECT_DIR="/home/vagrant/gtest_coverage_poc"
mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/tests" "$PROJECT_DIR/build"
chown -R vagrant:vagrant "$PROJECT_DIR"

echo "Environment setup complete."
