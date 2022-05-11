cmake_minimum_required(VERSION 3.18)

enable_testing()
add_library( random_generators random_generators.cpp random_generators.hpp experiment_helpers.cpp experiment_helpers.hpp time_measurement.cpp time_measurement.hpp )
target_link_libraries( random_generators opengv )


add_executable( test_absolute_pose test_absolute_pose.cpp )
target_link_libraries( test_absolute_pose opengv random_generators )
add_test(NAME test_absolute_pose
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_absolute_pose)

add_executable( test_absolute_pose_sac test_absolute_pose_sac.cpp )
target_link_libraries( test_absolute_pose_sac opengv random_generators )
add_test(NAME test_absolute_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_absolute_pose_sac)

add_executable( test_noncentral_absolute_pose test_noncentral_absolute_pose.cpp )
target_link_libraries( test_noncentral_absolute_pose opengv random_generators )
add_test(NAME test_noncentral_absolute_pose
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_noncentral_absolute_pose)

add_executable( test_noncentral_absolute_pose_sac test_noncentral_absolute_pose_sac.cpp )
target_link_libraries( test_noncentral_absolute_pose_sac opengv random_generators )
add_test(NAME test_noncentral_absolute_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_noncentral_absolute_pose_sac)

add_executable( test_multi_noncentral_absolute_pose_sac test_multi_noncentral_absolute_pose_sac.cpp )
target_link_libraries( test_multi_noncentral_absolute_pose_sac opengv random_generators )
add_test(NAME test_multi_noncentral_absolute_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_multi_noncentral_absolute_pose_sac)

add_executable( test_relative_pose test_relative_pose.cpp )
target_link_libraries( test_relative_pose opengv random_generators )
add_test(NAME test_relative_pose
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_relative_pose)

add_executable( test_relative_pose_rotationOnly test_relative_pose_rotationOnly.cpp )
target_link_libraries( test_relative_pose_rotationOnly opengv random_generators )
add_test(NAME test_relative_pose_rotationOnly
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_relative_pose_rotationOnly)

add_executable( test_relative_pose_rotationOnly_sac test_relative_pose_rotationOnly_sac.cpp )
target_link_libraries( test_relative_pose_rotationOnly_sac opengv random_generators )
add_test(NAME test_relative_pose_rotationOnly_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_relative_pose_rotationOnly_sac)

add_executable( test_relative_pose_sac test_relative_pose_sac.cpp )
target_link_libraries( test_relative_pose_sac opengv random_generators )
add_test(NAME test_relative_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_relative_pose_sac)

add_executable( test_noncentral_relative_pose test_noncentral_relative_pose.cpp )
target_link_libraries( test_noncentral_relative_pose opengv random_generators )
add_test(NAME test_noncentral_relative_pose
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_noncentral_relative_pose)

add_executable( test_noncentral_relative_pose_sac test_noncentral_relative_pose_sac.cpp )
target_link_libraries( test_noncentral_relative_pose_sac opengv random_generators )
add_test(NAME test_noncentral_relative_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_noncentral_relative_pose_sac)

add_executable( test_multi_noncentral_relative_pose_sac test_multi_noncentral_relative_pose_sac.cpp )
target_link_libraries( test_multi_noncentral_relative_pose_sac opengv random_generators )
add_test(NAME test_multi_noncentral_relative_pose_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_multi_noncentral_relative_pose_sac)

add_executable( test_eigensolver_sac test_eigensolver_sac.cpp )
target_link_libraries( test_eigensolver_sac opengv random_generators )
add_test(NAME test_eigensolver_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_eigensolver_sac)

add_executable( test_triangulation test_triangulation.cpp )
target_link_libraries( test_triangulation opengv random_generators )
add_test(NAME test_triangulation
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_triangulation)

add_executable( test_eigensolver test_eigensolver.cpp )
target_link_libraries( test_eigensolver opengv random_generators )
add_test(NAME test_eigensolver
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_eigensolver)

add_executable( test_point_cloud test_point_cloud.cpp )
target_link_libraries( test_point_cloud opengv random_generators )
add_test(NAME  test_point_cloud
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_point_cloud)

add_executable( test_point_cloud_sac test_point_cloud_sac.cpp )
target_link_libraries( test_point_cloud_sac opengv random_generators )
add_test(NAME test_point_cloud_sac
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_point_cloud_sac)

add_executable( test_Sturm test_Sturm.cpp )
target_link_libraries( test_Sturm opengv random_generators )
add_test(NAME test_Sturm
WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
COMMAND test_Sturm)
set_target_properties(
    test_absolute_pose
    test_absolute_pose_sac
    test_noncentral_absolute_pose
    test_noncentral_absolute_pose_sac
    test_multi_noncentral_absolute_pose_sac
    test_relative_pose
    test_relative_pose_rotationOnly
    test_relative_pose_rotationOnly_sac
    test_relative_pose_sac
    test_noncentral_relative_pose
    test_noncentral_relative_pose_sac
    test_multi_noncentral_relative_pose_sac
    test_eigensolver_sac
    test_triangulation
    test_eigensolver
    test_point_cloud
    test_point_cloud_sac
    test_Sturm

    PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED ON)