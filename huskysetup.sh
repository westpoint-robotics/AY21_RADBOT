#!/bin/bash
source /opt/ros/kinetic/setup.bash
source /home/user1/catkin_ws/devel/setup.bash

nmcli con up Husky

export ROS_MASTER_URI=http://CPR-A200-0559:11311
export ROS_IP=192.168.131.2


