#!/usr/bin/env python3

import rospy

import tf2_ros
from nav_msgs.msg import Odometry
from geometry_msgs.msg import TransformStamped


def ground_truth_subscriber_callback(data):
    br = tf2_ros.TransformBroadcaster()
    tf = TransformStamped()
    rospy.loginfo("I got gt!2")

    tf.header.stamp = rospy.Time.now()
    tf.header.frame_id = "map"
    tf.child_frame_id = "ground_truth"
    tf.transform.translation.x = data.pose.pose.position.z
    tf.transform.translation.y = data.pose.pose.position.x
    tf.transform.translation.z = data.pose.pose.position.y
    tf.transform.rotation = data.pose.pose.orientation

    br.sendTransform(tf)

if __name__ == '__main__':
    rospy.init_node('ground_truth_tf_broadcaster')
    rospy.Subscriber('/gazebo_ground_truth/odom',
                     Odometry,
                     ground_truth_subscriber_callback)
    rospy.loginfo(rospy.get_name() + ' started!')
    rospy.spin()
