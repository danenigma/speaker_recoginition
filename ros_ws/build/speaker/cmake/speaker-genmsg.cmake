# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "speaker: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ispeaker:/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(speaker_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg" NAME_WE)
add_custom_target(_speaker_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "speaker" "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(speaker
  "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speaker
)

### Generating Services

### Generating Module File
_generate_module_cpp(speaker
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speaker
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(speaker_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(speaker_generate_messages speaker_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg" NAME_WE)
add_dependencies(speaker_generate_messages_cpp _speaker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speaker_gencpp)
add_dependencies(speaker_gencpp speaker_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speaker_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(speaker
  "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speaker
)

### Generating Services

### Generating Module File
_generate_module_lisp(speaker
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speaker
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(speaker_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(speaker_generate_messages speaker_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg" NAME_WE)
add_dependencies(speaker_generate_messages_lisp _speaker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speaker_genlisp)
add_dependencies(speaker_genlisp speaker_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speaker_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(speaker
  "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speaker
)

### Generating Services

### Generating Module File
_generate_module_py(speaker
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speaker
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(speaker_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(speaker_generate_messages speaker_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dan/Desktop/speaker_detection/speaker_recoginition/ros_ws/src/speaker/msg/record.msg" NAME_WE)
add_dependencies(speaker_generate_messages_py _speaker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(speaker_genpy)
add_dependencies(speaker_genpy speaker_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS speaker_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speaker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/speaker
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(speaker_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speaker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/speaker
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(speaker_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speaker)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speaker\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/speaker
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(speaker_generate_messages_py std_msgs_generate_messages_py)
