#!/bin/bash
source /opt/ros/kinetic/setup.bash
source /home/user1/catkin_ws/devel/setup.bash

nmcli con up localROS
route add 192.168.1.201 enp0s31f6
export ROS_MASTER_URI=http://localhost:11311
export ROS_IP=192.168.3.100
rosrun rviz rviz -f velodyne &
roslaunch velodyne_pointcloud VLP16_points.launch
