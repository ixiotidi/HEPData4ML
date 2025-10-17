# Install script for directory: /home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/python/A

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "python" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so"
         RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3" TYPE MODULE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/3.12.11/pyHepMC3/pyHepMC3.so")
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so"
         OLD_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64:"
         NEW_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/clang/19.1.3-e838d/x86_64-el9/bin/llvm-strip" "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/pyHepMC3.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "python" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/CMakeFiles/CPythonpyHepMC33.12.11.dir/install-cxx-module-bmi-RELEASE.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "python" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/__init__.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3" TYPE FILE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/python/A/../src//__init__.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "python" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3-3.3.1-py3.12.egg-info")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages" TYPE FILE RENAME "pyHepMC3-3.3.1-py3.12.egg-info" FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/../pyHepMC3.egg-info")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonsearch" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so"
         RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search" TYPE MODULE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/3.12.11/pyHepMC3/search/pyHepMC3search.so")
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so"
         OLD_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64:"
         NEW_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/clang/19.1.3-e838d/x86_64-el9/bin/llvm-strip" "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/pyHepMC3search.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonsearch" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/CMakeFiles/CPythonpyHepMC3search3.12.11.dir/install-cxx-module-bmi-RELEASE.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonsearch" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search/__init__.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/search" TYPE FILE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/python/A/../src/search/__init__.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonsearch" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3.search-3.3.1-py3.12.egg-info")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages" TYPE FILE RENAME "pyHepMC3.search-3.3.1-py3.12.egg-info" FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/../pyHepMC3.search.egg-info")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonrootIO" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so"
         RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64:/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO" TYPE MODULE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/3.12.11/pyHepMC3/rootIO/pyHepMC3rootIO.so")
  if(EXISTS "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so"
         OLD_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/outputs/lib64:/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib:"
         NEW_RPATH "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib64:/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/clang/19.1.3-e838d/x86_64-el9/bin/llvm-strip" "$ENV{DESTDIR}/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/pyHepMC3rootIO.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonrootIO" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/CMakeFiles/CPythonpyHepMC3rootIO3.12.11.dir/install-cxx-module-bmi-RELEASE.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonrootIO" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO/__init__.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3/rootIO" TYPE FILE FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/HepMC3/python/A/../src/rootIO/__init__.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pythonrootIO" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages/pyHepMC3.rootIO-3.3.1-py3.12.egg-info")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/lib/python3.12/site-packages" TYPE FILE RENAME "pyHepMC3.rootIO-3.3.1-py3.12.egg-info" FILES "/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-build/python/A/../pyHepMC3.rootIO.egg-info")
endif()

