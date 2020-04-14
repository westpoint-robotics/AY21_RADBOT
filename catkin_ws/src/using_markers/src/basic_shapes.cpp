#include <ros/ros.h>
#include <std_msgs/String.h>
#include <visualization_msgs/Marker.h>

using namespace std;

void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  return msg;
}

int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
  // ros::Subscriber sub = n.subscribe("chatter", 1, chatterCallback);
  ros::Subscriber pose_sub = n.subscribe("husky_velocity_controller/odom/pose/pose/position",1,callback);
  

  // Set our initial shape type to be a cube
  uint32_t shape = visualization_msgs::Marker::SPHERE;
  int id = 0;

  // while (ros::ok())
  // {
  // cout << msg;
  // msg
  // x: -0.896723632095
  // y: 0.846575266662
  // z: 0.0

  // char str[] = "Geeks-for-Geeks"; 
  
  // // Returns first token  
  // char *token = strtok(str, "-"); 
  
  // // Keep printing tokens while one of the 
  // // delimiters present in str[]. 
  // while (token != NULL) 
  // { 
  //     printf("%s\n", token); 
  //     token = strtok(NULL, "-"); 
  // } 
  
  // return 0; 

  id += 1;
  visualization_msgs::Marker marker;
  // Set the frame ID and timestamp.  See the TF tutorials for information on these.
  marker.header.frame_id = "my_frame";
  marker.header.stamp = ros::Time::now();

  // Set the namespace and id for this marker.  This serves to create a unique ID
  // Any marker sent with the same namespace and id will overwrite the old one
  // marker.ns = "basic_shapes";
  marker.id = id;

  // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
  marker.type = shape;

  // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
  marker.action = visualization_msgs::Marker::ADD;

  // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
  marker.pose.position.x = -5.0 + static_cast <float> (rand()) / (static_cast <float> (RAND_MAX/10));
  marker.pose.position.y = -5.0 + static_cast <float> (rand()) / (static_cast <float> (RAND_MAX/10));
  marker.pose.position.z = 0;
  marker.pose.orientation.x = 0.0;
  marker.pose.orientation.y = 0.0;
  marker.pose.orientation.z = 0.0;
  marker.pose.orientation.w = 1.0;

  // Set the scale of the marker -- 1x1x1 here means 1m on a side
  marker.scale.x = 1.0;
  marker.scale.y = 1.0;
  marker.scale.z = 0.0;

  // Set the color -- be sure to set alpha to something non-zero!
  marker.color.r = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
  marker.color.g = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
  marker.color.b = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
  marker.color.a = 1.0;

  marker.lifetime = ros::Duration();

  // Publish the marker
  // while (marker_pub.getNumSubscribers() < 1)
  // {
  //   if (!ros::ok())
  //   {
  //     return 0;
  //   }
  //   ROS_WARN_ONCE("Please create a subscriber to the marker");
  //   sleep(1);
  // }
  marker_pub.publish(marker);

  r.sleep();
  ros::spin();
  // }
  // ros::Subscriber pose_sub = n.subscribe("husky_velocity_controller/odom/pose/pose/position",1,callback);
  // ros::spin();
}

// http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28c%2B%2B%29%28plain%20cmake%29

// https://github.com/wsnewman/ros_class/blob/master/example_ros_class/src/example_ros_class.cpp