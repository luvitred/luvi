
if (WithSharedLPEG)
  find_package(LPEG REQUIRED)
  link_directories(${LPEGLIB})
  set(EXTRA_LIBS ${EXTRA_LIBS} ${LPEGLIB})
else (WithSharedPCRE)
  set(LPEGLIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps/lpeg)

  include_directories(
    ${LPEGLIB_DIR}
  )

  add_library(LPEGLIB
    ${LPEGLIB_DIR}/lpcap.c
    ${LPEGLIB_DIR}/lpcode.c
    ${LPEGLIB_DIR}/lpprint.c
    ${LPEGLIB_DIR}/lptree.c
    ${LPEGLIB_DIR}/lpvm.c
  )

  set(EXTRA_LIBS ${EXTRA_LIBS} LPEGLIB)
endif (WithSharedLPEG)

add_definitions(-DLUA_LIB -DWITH_LPEG)
remove_definitions(-DNDEBUG)
remove_definitions(-DVERSION)
