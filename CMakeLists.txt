cmake_minimum_required(VERSION 3.10)
project(GTestCoveragePoC)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")

find_program(LCOV_EXECUTABLE lcov)
find_program(GENHTML_EXECUTABLE genhtml)

add_custom_target(coverage ALL
    DEPENDS math_operations_test
    COMMAND ctest --output-on-failure
    COMMAND ${LCOV_EXECUTABLE} --capture --directory . --output-file coverage.info
    COMMAND ${LCOV_EXECUTABLE} --remove coverage.info '/usr/*' '*/tests/*' '*/ll*' --output-file filtered_coverage.info
    COMMAND ${GENHTML_EXECUTABLE} filtered_coverage.info --output-directory coverage_report
    COMMAND ${CMAKE_COMMAND} -E echo "Coverage report generated in ${CMAKE_BINARY_DIR}/coverage_report"
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running tests and generating code coverage report..."
    VERBATIM
)

# Add a custom clean step for coverage reports
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
    "${CMAKE_BINARY_DIR}/coverage.info"
    "${CMAKE_BINARY_DIR}/filtered_coverage.info"
    "${CMAKE_BINARY_DIR}/coverage_report"
)

# Add source directory
add_subdirectory(src)

# Add test directory
enable_testing()
add_subdirectory(tests)
