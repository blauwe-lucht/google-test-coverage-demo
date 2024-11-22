find_package(GTest REQUIRED)

add_executable(math_operations_test math_operations_test.cpp)
target_link_libraries(math_operations_test PRIVATE math_operations GTest::gtest_main)

# Add tests
include(GoogleTest)
gtest_discover_tests(math_operations_test)

# Add coverage flags for GCC/Clang
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(math_operations PRIVATE -fprofile-arcs -ftest-coverage)
    target_link_options(math_operations PRIVATE -fprofile-arcs -ftest-coverage)
endif()
