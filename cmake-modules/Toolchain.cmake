
function(toolchain_library subdir)
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${subdir})
    add_custom_target(${subdir} ALL
            DEPENDS ${SNESDEV_TOOLCHAIN_FILE} ${SNESDEV_TARGET_NAME}-cc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${subdir}
            COMMAND ${CMAKE_COMMAND}
            -DCMAKE_TOOLCHAIN_FILE=${SNESDEV_TOOLCHAIN_FILE}
            -DCMAKE_INSTALL_PREFIX=${SNESDEV_SYSROOT}
            -G${CMAKE_GENERATOR} ${CMAKE_CURRENT_SOURCE_DIR}/${subdir}
            COMMAND ${CMAKE_COMMAND})
endfunction()