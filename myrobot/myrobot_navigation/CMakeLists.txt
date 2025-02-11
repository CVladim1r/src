cmake_minimum_required(VERSION 2.8.3)
project(myrobot_navigation)

find_package(catkin REQUIRED COMPONENTS
  angles
  costmap_2d
  dynamic_reconfigure
  geometry_msgs
  pluginlib
  roscpp
  sensor_msgs)

generate_dynamic_reconfigure_options(config/RangeSensorLayerGlobal.cfg)

catkin_package(
    CATKIN_DEPENDS angles costmap_2d dynamic_reconfigure geometry_msgs pluginlib roscpp sensor_msgs
    INCLUDE_DIRS include
    LIBRARIES range_sensor_layer
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_library(range_sensor_layer_global src/range_sensor_layer_global.cpp)
add_dependencies(range_sensor_layer_global ${range_sensor_layer_global_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(range_sensor_layer_global ${catkin_LIBRARIES})

install(TARGETS range_sensor_layer_global
        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
)

install(FILES costmap_plugins.xml
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
        DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)

install(DIRECTORY launch
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(DIRECTORY config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})