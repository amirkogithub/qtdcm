set(BUILD_SHARED_LIBS CACHE FORCE "Build QtDCM with shared libraries." OFF)
set(CPACK_GENERATOR ${CPACK_GENERATOR};RPM)
set(CPACK_RPM ON)
if (BUILD_PACKAGE_BINARY)
  option(BUILD_PACKAGE_DEV "Package development distribution of QtDCM" OFF)
  set(CPACK_PACKAGE_NAME "qtdcm-dev")
  set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "QtDCM")
  set(CPACK_RPM_PACKAGE_DESCRIPTION "QtDCM")
else (BUILD_PACKAGE_BINARY)
  option(BUILD_PACKAGE_BINARY "Package binary distribution of QtDCM" OFF)
  set(CPACK_PACKAGE_NAME "qtdcm-dev")
  set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "QtDCM")
  set(CPACK_RPM_PACKAGE_DESCRIPTION "QtDCM")
  set(CPACK_PACKAGE_FILE_NAME "qtdcm-dev-${QTDCM_VERSION_MAJOR}.${QTDCM_VERSION_MINOR}.${QTDCM_VERSION_PATCH}")
endif(BUILD_PACKAGE_BINARY)
