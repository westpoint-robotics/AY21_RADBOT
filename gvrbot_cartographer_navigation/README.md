# GVRBot Cartographer Demo
This is based on Jackal Cartographer Navigation found at: https://github.com/jackal/jackal_cartographer_navigation

This tutorial shows you how to use [move_base](http://wiki.ros.org/move_base) with [Google Cartographer](https://github.com/googlecartographer) to perform autonomous planning and movement with simultaneous localization and mapping (SLAM), on a simulated GVRBot, or a factory-standard GVRBot with a laser scanner publishing on the */front/scan* topic.

To learn about move_base and the navigation stack, see the [Navigation Tutorials](http://wiki.ros.org/navigation/Tutorials). To learn more about Google Cartographer for ROS, see the [Cartographer ROS](https://google-cartographer-ros.readthedocs.io/en/latest/) documentation.

## Instructions

  1. To get started: 

      - Launch the Gazebo simulation with the *front_laser* config:  
        `roslaunch gvrbot_gazebo gvrbot_world.launch config:=front_laser`

      - Launch the Cartographer node to begin SLAM:  
        `roslaunch gvrbot_cartographer_navigation cartographer_demo.launch`

      - Launch Rviz:  
        `roslaunch gvrbot_viz view_robot.launch`

  2. In the Rviz visualizer, make sure the visualizers in the Navigation group are enabled.

  3. Use the 2D Nav Goal tool in the top toolbar to select a movement goal in the visualizer. Make sure to select an unoccupied (dark grey) or unexplored (light grey) location.


  4. To save the generated map, you can run the map_saver utility:

     `rosrun map_server map_saver -f <filename>`

#### Tuning Cartographer

To tune Cartographer for low latency SLAM, edit the *gvrbot.lua* configuration file found in the *gvrbot_cartographer_navigation/config* directory.

For more information on tuning, click [here](http://google-cartographer-ros.readthedocs.io/en/latest/tuning.html)
