# Install script for directory: /home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/rootIO

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/cvmfs/sft.cern.ch/lcg/releases/clang/19.1.3-e838d/x86_64-el9/bin/llvm-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOlibs" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3"
         RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64:/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE SHARED_LIBRARY FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64/libHepMC3rootIO.so.3")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3"
         OLD_RPATH "/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib:/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64:"
         NEW_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64:/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/clang/19.1.3-e838d/x86_64-el9/bin/llvm-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libHepMC3rootIO.so.3")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOlibs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE SHARED_LIBRARY FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64/libHepMC3rootIO.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOlibs" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/rootIO/CMakeFiles/HepMC3rootIO.dir/install-cxx-module-bmi-RELEASE.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOlibs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE DIRECTORY FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64/" FILES_MATCHING REGEX "/[^/]*\\.pcm$" REGEX "/[^/]*\\.rootmap$" REGEX "/CMakeFiles$" EXCLUDE REGEX "/src$" EXCLUDE REGEX "/include$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOdevel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/rootIO/include/HepMC3")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "rootIOdevel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake/HepMC3rootIOTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake/HepMC3rootIOTargets.cmake"
         "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/rootIO/CMakeFiles/Export/cf3e329493f6024abbb60b82a27ccf67/HepMC3rootIOTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake/HepMC3rootIOTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake/HepMC3rootIOTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake" TYPE FILE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/rootIO/CMakeFiles/Export/cf3e329493f6024abbb60b82a27ccf67/HepMC3rootIOTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HepMC3/cmake" TYPE FILE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/rootIO/CMakeFiles/Export/cf3e329493f6024abbb60b82a27ccf67/HepMC3rootIOTargets-release.cmake")
  endif()
endif()

