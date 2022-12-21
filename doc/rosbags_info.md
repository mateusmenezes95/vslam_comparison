# ROS Bags Contents

To access the bags files, please, contact me in the email mateusmenezes95@gmail.com

## Rectangular Trajectory

```console
path:         rectangular-trajectory.bag
version:      2.0
duration:     1:37s (97s)
start:        Dec 12 2022 14:59:44.56 (1670867984.56)
end:          Dec 12 2022 15:01:22.23 (1670868082.23)
size:         5.1 GB
messages:     61440
compression:  lz4 [11502/11502 chunks; 44.01%]
uncompressed: 11.6 GB @ 121.2 MB/s
compressed:    5.1 GB @  53.3 MB/s (44.01%)
types:        geometry_msgs/Twist    [9f195f881246fdfa2798d1d3eebca84a]
              nav_msgs/Odometry      [cd5e73d190d741a2f92e81eda573aca7]
              rosgraph_msgs/Clock    [a9c97c1d230cfc112e270351a944ee47]
              sensor_msgs/Image      [060021388200f6f0f447d0fcd9c64743]
              sensor_msgs/Imu        [6a62c6daae103f4ff57a132d6f95cec2]
              sensor_msgs/JointState [3066dcd76a6cfaef579bd0f34173e9fd]
              sensor_msgs/LaserScan  [90c7ef2dc6895d81024acba2ac42f369]
              tf2_msgs/TFMessage     [94810edda583a504dfda3829e70d7eec]
topics:       /clock                                9762 msgs    : rosgraph_msgs/Clock   
              /front/scan                           4880 msgs    : sensor_msgs/LaserScan 
              /gazebo_ground_truth/odom             2440 msgs    : nav_msgs/Odometry     
              /husky_velocity_controller/cmd_vel    1029 msgs    : geometry_msgs/Twist   
              /imu/data                             4881 msgs    : sensor_msgs/Imu       
              /joint_states                         4878 msgs    : sensor_msgs/JointState
              /odometry/filtered                    4878 msgs    : nav_msgs/Odometry     
              /realsense/color/image_raw            5751 msgs    : sensor_msgs/Image     
              /realsense/depth/image_rect_raw       5751 msgs    : sensor_msgs/Image     
              /tf                                  17189 msgs    : tf2_msgs/TFMessage     (4 connections)
              /tf_static                               1 msg     : tf2_msgs/TFMessage
```

## Figure-Eight Trajectory

```
path:         eight-trajectory.bag
version:      2.0
duration:     1:31s (91s)
start:        Dec 12 2022 15:20:04.35 (1670869204.35)
end:          Dec 12 2022 15:21:36.28 (1670869296.28)
size:         4.0 GB
messages:     54547
compression:  lz4 [8787/8787 chunks; 44.88%]
uncompressed: 8.8 GB @ 98.4 MB/s
compressed:   4.0 GB @ 44.2 MB/s (44.88%)
types:        geometry_msgs/Twist    [9f195f881246fdfa2798d1d3eebca84a]
              nav_msgs/Odometry      [cd5e73d190d741a2f92e81eda573aca7]
              rosgraph_msgs/Clock    [a9c97c1d230cfc112e270351a944ee47]
              sensor_msgs/Image      [060021388200f6f0f447d0fcd9c64743]
              sensor_msgs/Imu        [6a62c6daae103f4ff57a132d6f95cec2]
              sensor_msgs/JointState [3066dcd76a6cfaef579bd0f34173e9fd]
              sensor_msgs/LaserScan  [90c7ef2dc6895d81024acba2ac42f369]
              tf2_msgs/TFMessage     [94810edda583a504dfda3829e70d7eec]
topics:       /clock                                9189 msgs    : rosgraph_msgs/Clock   
              /front/scan                           4593 msgs    : sensor_msgs/LaserScan 
              /gazebo_ground_truth/odom             2296 msgs    : nav_msgs/Odometry     
              /husky_velocity_controller/cmd_vel     593 msgs    : geometry_msgs/Twist   
              /imu/data                             4594 msgs    : sensor_msgs/Imu       
              /joint_states                         4593 msgs    : sensor_msgs/JointState
              /odometry/filtered                    4592 msgs    : nav_msgs/Odometry     
              /realsense/color/image_raw            4394 msgs    : sensor_msgs/Image     
              /realsense/depth/image_rect_raw       4392 msgs    : sensor_msgs/Image     
              /tf                                  15310 msgs    : tf2_msgs/TFMessage     (4 connections)
              /tf_static                               1 msg     : tf2_msgs/TFMessage
```

## Straight Line Trajectory

```
path:         straight-line.bag
version:      2.0
duration:     1:11s (71s)
start:        Dec 12 2022 15:15:50.26 (1670868950.26)
end:          Dec 12 2022 15:17:01.43 (1670869021.43)
size:         3.6 GB
messages:     44619
compression:  lz4 [8211/8211 chunks; 43.65%]
uncompressed: 8.3 GB @ 118.7 MB/s
compressed:   3.6 GB @  51.8 MB/s (43.65%)
types:        geometry_msgs/Twist    [9f195f881246fdfa2798d1d3eebca84a]
              nav_msgs/Odometry      [cd5e73d190d741a2f92e81eda573aca7]
              rosgraph_msgs/Clock    [a9c97c1d230cfc112e270351a944ee47]
              sensor_msgs/Image      [060021388200f6f0f447d0fcd9c64743]
              sensor_msgs/Imu        [6a62c6daae103f4ff57a132d6f95cec2]
              sensor_msgs/JointState [3066dcd76a6cfaef579bd0f34173e9fd]
              sensor_msgs/LaserScan  [90c7ef2dc6895d81024acba2ac42f369]
              tf2_msgs/TFMessage     [94810edda583a504dfda3829e70d7eec]
topics:       /clock                                7115 msgs    : rosgraph_msgs/Clock   
              /front/scan                           3556 msgs    : sensor_msgs/LaserScan 
              /gazebo_ground_truth/odom             1778 msgs    : nav_msgs/Odometry     
              /husky_velocity_controller/cmd_vel     836 msgs    : geometry_msgs/Twist   
              /imu/data                             3557 msgs    : sensor_msgs/Imu       
              /joint_states                         3556 msgs    : sensor_msgs/JointState
              /odometry/filtered                    3556 msgs    : nav_msgs/Odometry     
              /realsense/color/image_raw            4107 msgs    : sensor_msgs/Image     
              /realsense/depth/image_rect_raw       4104 msgs    : sensor_msgs/Image     
              /tf                                  12453 msgs    : tf2_msgs/TFMessage     (4 connections)
              /tf_static                               1 msg     : tf2_msgs/TFMessage
```