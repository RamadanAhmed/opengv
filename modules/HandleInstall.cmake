include(HandleWindows)

function(install_target library_name)
    set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${library_name}")

    set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")

    # Configuration
    set(version_config "${generated_dir}/${library_name}-config-version.cmake")
    set(project_config "${generated_dir}/${library_name}-config.cmake")
    set(TARGETS_EXPORT_NAME "${library_name}Targets")
    set(namespace "${library_name}::")

    include(CMakePackageConfigHelpers)

    write_basic_package_version_file(
        "${version_config}" COMPATIBILITY SameMajorVersion
    )

    configure_package_config_file(
        "modules/Config.cmake.in"
        "${project_config}"
        INSTALL_DESTINATION "${config_install_dir}"
    )

    install(
        TARGETS ${library_name}
        EXPORT "${TARGETS_EXPORT_NAME}"
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    )

    # Headers:
    install (DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/include/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

    install(
        FILES "${project_config}" "${version_config}"
        DESTINATION "${config_install_dir}"
    )

    # install pdb-files
    install_binary_for_target(${library_name})
    install_pdb_for_target(${library_name})
    install(
        EXPORT "${TARGETS_EXPORT_NAME}"
        NAMESPACE "${namespace}"
        DESTINATION "${config_install_dir}"
    )
endfunction(install_target)



