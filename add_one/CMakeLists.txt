cmake_minimum_required(VERSION 2.8)

project(add_one)

find_package(add_zero REQUIRED)

add_library(${PROJECT_NAME} add.cpp include/add_one.h)

target_include_directories(${PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "include/add_one.h")

install(TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}-targets
    PUBLIC_HEADER DESTINATION include/add_one
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(EXPORT ${PROJECT_NAME}-targets
    # NAMESPACE ${PROJECT_NAME}::
    FILE ${PROJECT_NAME}-config.cmake
    DESTINATION lib/cmake/${PROJECT_NAME})