# AY21_RADBOT

## Overview
Repo for RADBOT

## Simulating RADBOT

    roslaunch gvrbot_gazebo gvrbot_world.launch
    roslaunch gvrbot_viz view_robot.launch

## Running on actual robot

    roslaunch gvrbot_bringup bringup.launch

Dependencies
    velodyne_description:
    sudo apt-get install ros-melodic-velodyne-description
    realsense2-description
    sudo apt-get install ros-melodic-realsense2-description 
    gvrbot
