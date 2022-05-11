include(GNUInstallDirs)
function(set_dll_directory target dll_output_dir)
  if(MSVC)
    set_target_properties(${target}
                          PROPERTIES
                          RUNTIME_OUTPUT_DIRECTORY "${dll_output_dir}")
  endif()
endfunction()

function(install_binary_for_target target)
  if(MSVC)
    get_target_property(dll_build_dir ${target} RUNTIME_OUTPUT_DIRECTORY)
    
    get_target_property(target_type ${target} TYPE)
    if (target_type STREQUAL "EXECUTABLE")
      install (DIRECTORY ${dll_build_dir}/ DESTINATION "${CMAKE_INSTALL_BINDIR}" FILES_MATCHING PATTERN "*.dll")
    elseif(target_type STREQUAL "SHARED_LIBRARY")
      install (DIRECTORY ${dll_build_dir}/ DESTINATION "${CMAKE_INSTALL_BINDIR}" FILES_MATCHING PATTERN "*.dll")
    endif()
    install (
        DIRECTORY 
          ${dll_build_dir}/ 
        DESTINATION 
          "${CMAKE_INSTALL_BINDIR}"
        FILES_MATCHING 
          PATTERN "*.dll")
  endif()
endfunction()

function(set_pdb_directory target pdb_output_dir)
  if(MSVC)
    set_target_properties(${target}
                          PROPERTIES
                          PDB_OUTPUT_DIRECTORY "${pdb_output_dir}")
  endif()
endfunction()

function(install_pdb_for_target target)
  if(MSVC)
    get_target_property(pdb_build_dir ${target} PDB_OUTPUT_DIRECTORY)
    get_target_property(target_type ${target} TYPE)
    if (target_type STREQUAL "EXECUTABLE")
      install (DIRECTORY ${pdb_build_dir}/ DESTINATION "${CMAKE_INSTALL_BINDIR}")
    elseif(target_type STREQUAL "STATIC_LIBRARY")
      install (DIRECTORY ${pdb_build_dir}/ DESTINATION "${CMAKE_INSTALL_LIBDIR}")
    elseif(target_type STREQUAL "SHARED_LIBRARY")
      install (DIRECTORY ${pdb_build_dir}/ DESTINATION "${CMAKE_INSTALL_BINDIR}")
    endif()
  endif()
endfunction()