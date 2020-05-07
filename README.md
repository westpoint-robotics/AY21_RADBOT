# RADBOT

## Project Description
RadBot (Radiation Robot) is a tethered, manually operated robot that has the ability to operate in high-radiation environments with the purpose of performing unmanned reconnaissance

## Project Objectives
- Tether Tangling Prevention  
- 2D Localized Environment Mapping
- 2D Heatmap of Radiation Hotspots  
- Photo/Video Capabilities

## Project Tools
- SLAM (Simultaneous Localization And Mapping)
- Google Cartographer
- HUSKY A200
- 16 Channel LiDAR
- Amcrest Infrared Security Camera
- ROS Kinetic
- Ubuntu 16.04

## Github Files Info
### Control
This folder contains scripts to control the hardware systems on the Husky A200 including the Amcrest camera
### Interface
This folder contains scripts to interface with the Husky's network and the Lidar's network
### Visualize
This folder contains the visualization maps including code for the heatmap
### catkin_ws
This folder contains the workspace setup necessary to run the simulation files

## Where to Start?
Become familiar with ROS (http://wiki.ros.org/ROS/StartGuide)
Become familiar with C and C++
Run through some tutorials (http://wiki.ros.org/ROS/Tutorials)

## Running The Simulation
Run tests with the Jackal (https://www.clearpathrobotics.com/assets/guides/kinetic/jackal/simulation.html)

### Gazebo
Gazebo is a simulated three-dimensional environment with realistic physics meant to test software functionality

### Rviz
Rviz (ROS visualization) is a three-dimensional visualization tool for ROS. Within Rviz, a robot operator can visualize 2D/3D mapping output. 

## Setting Up Catkin Workspace
Catkin is the official build system of ROS and the successor to the original ROS build system, rosbuild. catkin combines CMake macros and Python scripts to provide some functionality on top of CMake's normal workflow. catkin was designed to be more conventional than rosbuild, allowing for better distribution of packages, better cross-compiling support, and better portability. catkin's workflow is very similar to CMake's but adds support for automatic 'find package' infrastructure and building multiple, dependent projects at the same time. The name catkin comes from the tail-shaped flower cluster found on willow trees -- a reference to Willow Garage where catkin was created. (http://wiki.ros.org/catkin/conceptual_overview)  
Create a workspace: http://wiki.ros.org/catkin/Tutorials/create_a_workspace

## Google Cartographer
https://google-cartographer.readthedocs.io/en/latest/
https://google-cartographer-ros.readthedocs.io/en/latest/

## Husky Integration with Google Cartographer
https://github.com/husky/husky_cartographer_navigation

## Heatmap
The heatmap was based on inserting 2D spheres at a specifc X,Y,Z coordinate in Rviz. This coordinate is supposed to be derived from RADBOT's transform ROS topic. We were unable to fully implement functionality with the transform ROS topic due to difficulties with the pub-sub nature of ROS. We substituted by inserting random datapoints into the algorithm as a proof of concept. (https://wiki.ros.org/rviz/Tutorials/Markers:%20Basic%20Shapes)  
### Final Videos
https://youtu.be/AtxlUbtp6-c (updated)
https://youtu.be/2OxCcPV-RPg (original)
