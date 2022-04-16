project(myapp)
cmake_minimum_required(VERSION 2.8)

find_package(add_three REQUIRED)

add_executable(${PROJECT_NAME} app.cpp)
target_link_libraries(${PROJECT_NAME} add_three::add_three add_two::add_two)

install(TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}-targets
    PUBLIC_HEADER DESTINATION include
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(EXPORT ${PROJECT_NAME}-targets
    NAMESPACE ${PROJECT_NAME}::
    FILE ${PROJECT_NAME}-config.cmake
    DESTINATION lib/cmake/${PROJECT_NAME})