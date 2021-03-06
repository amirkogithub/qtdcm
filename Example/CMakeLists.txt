cmake_minimum_required(VERSION 2.6)

project(QTDCMEXAMPLE)

if(NOT MSVC)
  add_definitions( -Wno-deprecated -DHAVE_CONFIG_H -fPIC )
endif()

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${QTDCMEXAMPLE_SOURCE_DIR}")
set (QTDCM_DIR "${QTDCM_BINARY_DIR}")

find_package(QtDCM REQUIRED)
if (QTDCM_FOUND)
  include(${QTDCM_USE_FILE})
endif (QTDCM_FOUND)

find_package(ITK REQUIRED)
if(ITK_FOUND)
  include(${ITK_USE_FILE})
endif(ITK_FOUND)

set(SAMPLE_SRCS
  ${QTDCMEXAMPLE_SOURCE_DIR}/main.cpp
  ${QTDCMEXAMPLE_SOURCE_DIR}/dicom.cpp
)

set(SAMPLE_HDRS
  ${QTDCMEXAMPLE_SOURCE_DIR}/dicom.h
)

set(SAMPLE_UIS
  ${QTDCMEXAMPLE_SOURCE_DIR}/dicom.ui
)

set(SAMPLE_MOC_HDRS ${SAMPLE_HDRS})

qt4_wrap_ui( SAMPLE_UI_HDRS ${SAMPLE_UIS})
qt4_wrap_cpp( SAMPLE_MOC_SRCS ${SAMPLE_MOC_HDRS})

include_directories(${CMAKE_BINARY_DIR} ${QTDCM_INCLUDE_DIR} ${QTDCM_DIR} ${QTDCMEXAMPLE_BINARY_DIR})

add_executable( dicom ${SAMPLE_SRCS} ${SAMPLE_MOC_SRCS} ${SAMPLE_UI_HDRS})
target_link_libraries( dicom qtdcm ${QT_LIBRARIES} ${QT_QTNETWORK_LIBRARY} )

if(APPLE)
  include(FixDCMTKMacLink)
  message("${QTDCM_DIR}")
  FixDCMTKMacExeLink(dicom ${QTDCM_BINARY_DIR})
endif(APPLE)

