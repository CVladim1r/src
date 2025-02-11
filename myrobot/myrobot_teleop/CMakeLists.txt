cmake_minimum_required(VERSION 2.8.3)
project(myrobot_teleop)

find_package(catkin REQUIRED COMPONENTS
  rospy
  roscpp
  geometry_msgs
  sensor_msgs
)

catkin_package(
  CATKIN_DEPENDS rospy roscpp geometry_msgs sensor_msgs
)


catkin_install_python(PROGRAMS
  nodes/keyboard_teleop
  nodes/auto_teleop
  nodes/auto_teleop_my
  nodes/keyboard_manipulator
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/nodes
)

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

