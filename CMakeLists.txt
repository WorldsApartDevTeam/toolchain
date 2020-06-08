cmake_minimum_required(VERSION 3.15)
project(worldsapart-toolchain C CXX)

set(LLVM_ENABLE_PROJECTS "lld")
set(LLVM_INSTALL_BINUTILS_SYMLINKS ON)

# Using SNESDEV Target variables because qc expects such variables
set(SNESDEV_BOOTSTRAP ON)
set(SNESDEV_TARGET_SYSTEM none CACHE STRING "Sets the OS for Cross compilation (defaults to none)" )
set(SNESDEV_TARGET_VENDOR snes CACHE STRING "Sets the vendor/platform for cross compilation (defaults to snes)")
set(SNESDEV_TARGET_ABI elf CACHE STRING "Sets the abi for cross compilation (defaults to elf)")
set(SNESDEV_TARGET_NAME wc65c816-${SNESDEV_TARGET_VENDOR}-${SNESDEV_TARGET_SYSTEM}-${SNESDEV_TARGET_ABI})
set(SNESDEV_SYSROOT ${CMAKE_INSTALL_PREFIX}/sysroot)

configure_file(cross/wc65c816-snes-generic-elf.cmake.in cross/wc65c816-snes-generic-elf.cmake @ONLY)


add_subdirectory(llvm-project/llvm)
set(COMPILER_TARGET ${SNESDEV_TARGET_NAME})
add_subdirectory(65816-c)
unset(COMPILER_TARGET)
# add_subdirectory(qc)

install(DIRECTORY DESTINATION ${SNESDEV_SYSROOT})
install(FILES ld/wc65c816-snes-none-elf.ld ld/wc65816-snesdev-vectors.ld DESTINATION ${SNESDEV_SYSROOT}/lib)


