# AY21_RADBOT

## Overview
Repo for RADBOT

## Initial Setup
    clone this repository
    Install dependencies located below
    Set Udev rule for Inertial Measurement Unit (Microstrain 3DM-GX5)
    Follow Connection_guide.md
    
## Simulating RADBOT

    roslaunch gvrbot_gazebo gvrbot_world.launch
    roslaunch gvrbot_viz view_robot.launch

## Running on actual robot

    roslaunch gvrbot_bringup bringup.launch

## Dependencies 
    velodyne_description: 
    sudo apt-get install ros-melodic-velodyne-description 
    realsense2-description: 
    sudo apt-get install ros-melodic-realsense2-description 
