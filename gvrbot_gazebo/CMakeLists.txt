cmake_minimum_required(VERSION 2.8.3)
project(gvrbot_gazebo)

find_package(catkin REQUIRED COMPONENTS roslaunch)

catkin_package()

roslaunch_add_file_check(launch/gvrbot_world.launch)

install(DIRECTORY launch Media worlds
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
