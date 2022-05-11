cmake_minimum_required(VERSION 3.18)

project(opengv VERSION 1.0 LANGUAGES CXX)

###############################     Project Var   ############################################
set(library_name ${PROJECT_NAME})
set(library_alias_name MCSImageProcessing::${PROJECT_NAME})
set(library_export_file_name "opengv_export.h")
set(library_export_base_name "opengv")
set(library_product_version_name "opengv")
set(library_output_dir ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/modules)
###############################     Project Var   ############################################
###############################     CMake Module  ############################################
include(CompilerWarnings)
include(HandleInstall)
###############################     CMake Module  ############################################
###############################     Project Var   ############################################
############################### REQUIRED Package #############################################
find_package(Eigen3 CONFIG REQUIRED)
############################### REQUIRED Package #############################################
###############################      Option      #############################################
option(BUILD_TESTS    "Enable test cases"   OFF)
option(BUILD_PYTHON   "Enable Python Libs"  OFF)
###############################      Option      #############################################

###############################  Auto Generated ##############################################
set(generated_headers "${CMAKE_CURRENT_BINARY_DIR}/generated_headers")
set(library_export "${generated_headers}/${library_export_base_name}/${library_export_file_name}")
###############################  Auto Generated ##############################################

###############################   ImageEnhancement   #########################################
add_library(${library_name} STATIC)
add_library(${library_alias_name} ALIAS ${library_name})

target_sources(${library_name}
               PRIVATE
               src/absolute_pose/modules/main.cpp
               src/absolute_pose/modules/gp3p/code.cpp
               src/absolute_pose/modules/gp3p/init.cpp
               src/absolute_pose/modules/gp3p/reductors.cpp
               src/absolute_pose/modules/gp3p/spolynomials.cpp
               src/absolute_pose/modules/Epnp.cpp
               src/absolute_pose/modules/gpnp1/code.cpp
               src/absolute_pose/modules/gpnp1/init.cpp
               src/absolute_pose/modules/gpnp1/reductors.cpp
               src/absolute_pose/modules/gpnp1/spolynomials.cpp
               src/absolute_pose/modules/gpnp2/code.cpp
               src/absolute_pose/modules/gpnp2/init.cpp
               src/absolute_pose/modules/gpnp2/reductors.cpp
               src/absolute_pose/modules/gpnp2/spolynomials.cpp
               src/absolute_pose/modules/gpnp3/code.cpp
               src/absolute_pose/modules/gpnp3/init.cpp
               src/absolute_pose/modules/gpnp3/reductors.cpp
               src/absolute_pose/modules/gpnp3/spolynomials.cpp
               src/absolute_pose/modules/gpnp4/code.cpp
               src/absolute_pose/modules/gpnp4/init.cpp
               src/absolute_pose/modules/gpnp4/reductors.cpp
               src/absolute_pose/modules/gpnp4/spolynomials.cpp
               src/absolute_pose/modules/gpnp5/code.cpp
               src/absolute_pose/modules/gpnp5/init.cpp
               src/absolute_pose/modules/gpnp5/reductors.cpp
               src/absolute_pose/modules/gpnp5/spolynomials.cpp
               src/absolute_pose/modules/upnp2.cpp
               src/absolute_pose/modules/upnp4.cpp
               src/relative_pose/modules/main.cpp
               src/relative_pose/modules/fivept_nister/modules.cpp
               src/relative_pose/modules/fivept_stewenius/modules.cpp
               src/relative_pose/modules/fivept_kneip/code.cpp
               src/relative_pose/modules/fivept_kneip/init.cpp
               src/relative_pose/modules/fivept_kneip/reductors.cpp
               src/relative_pose/modules/fivept_kneip/spolynomials.cpp
               src/relative_pose/modules/sixpt/modules2.cpp
               src/relative_pose/modules/eigensolver/modules.cpp
               src/relative_pose/modules/ge/modules.cpp
               src/math/cayley.cpp
               src/math/quaternion.cpp
               src/math/arun.cpp
               src/math/Sturm.cpp
               src/math/roots.cpp
               src/math/gauss_jordan.cpp
               src/absolute_pose/methods.cpp
               src/absolute_pose/CentralAbsoluteAdapter.cpp
               src/absolute_pose/NoncentralAbsoluteAdapter.cpp
               src/absolute_pose/NoncentralAbsoluteMultiAdapter.cpp
               src/relative_pose/methods.cpp
               src/relative_pose/CentralRelativeAdapter.cpp
               src/relative_pose/CentralRelativeWeightingAdapter.cpp
               src/relative_pose/NoncentralRelativeAdapter.cpp
               src/relative_pose/CentralRelativeMultiAdapter.cpp
               src/relative_pose/NoncentralRelativeMultiAdapter.cpp
               src/triangulation/methods.cpp
               src/point_cloud/methods.cpp
               src/point_cloud/PointCloudAdapter.cpp
               src/sac_problems/absolute_pose/AbsolutePoseSacProblem.cpp
               src/sac_problems/absolute_pose/MultiNoncentralAbsolutePoseSacProblem.cpp
               src/sac_problems/relative_pose/CentralRelativePoseSacProblem.cpp
               src/sac_problems/relative_pose/NoncentralRelativePoseSacProblem.cpp
               src/sac_problems/relative_pose/RotationOnlySacProblem.cpp
               src/sac_problems/relative_pose/TranslationOnlySacProblem.cpp
               src/sac_problems/relative_pose/EigensolverSacProblem.cpp
               src/sac_problems/relative_pose/MultiCentralRelativePoseSacProblem.cpp
               src/sac_problems/relative_pose/MultiNoncentralRelativePoseSacProblem.cpp
               src/sac_problems/point_cloud/PointCloudSacProblem.cpp
               src/absolute_pose/MACentralAbsolute.cpp
               src/absolute_pose/MANoncentralAbsolute.cpp
               src/relative_pose/MACentralRelative.cpp
               src/relative_pose/MANoncentralRelative.cpp
               src/relative_pose/MANoncentralRelativeMulti.cpp
               src/point_cloud/MAPointCloud.cpp
)

include(GenerateExportHeader)
generate_export_header(${library_name}
                       EXPORT_FILE_NAME ${library_export}
                       BASE_NAME ${library_export_base_name})

target_include_directories(${library_name}
                           PUBLIC
                           $<BUILD_INTERFACE:${generated_headers}>
                           $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>)

target_link_libraries(${library_name}
                      PUBLIC
                      Eigen3::Eigen)


target_compile_definitions(${library_name} PUBLIC NOMINMAX _USE_MATH_DEFINES)

target_compile_features(${library_name} PUBLIC cxx_std_17)

set_project_warnings(${library_name})
set_dll_directory(${library_name} ${library_output_dir})
set_pdb_directory(${library_name} ${CMAKE_CURRENT_BINARY_DIR}/pdb)
###############################   ImageEnhancement   #########################################
if (BUILD_PYTHON)
  add_subdirectory( python )
endif()
if (BUILD_TESTS)
  add_subdirectory( test )
endif()
###############################      INSTALL      ############################################
install_target(${library_name})
# Export headers:
install (DIRECTORY "${generated_headers}/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
###############################      INSTALL      ############################################
###############################      Package      ############################################
set(CPACK_GENERATOR "7Z")
set(CPACK_PACKAGE_VERSION "${${library_name}_VERSION}")
include(CPack)
###############################      Package      ############################################
include(FeatureSummary)
feature_summary(WHAT ALL)