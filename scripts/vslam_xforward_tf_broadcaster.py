#!/usr/bin/env python3

import rospy

import tf2_ros
from geometry_msgs.msg import PoseStamped, TransformStamped


def get_orb_slam_camera_pose(msg):
    br = tf2_ros.TransformBroadcaster()
    tf = TransformStamped()

    tf.header.stamp = rospy.Time.now()
    tf.header.frame_id = "map"
    tf.child_frame_id = "orb_slam_camera_aligned"
    tf.transform.translation.x = msg.pose.position.z
    tf.transform.translation.y = -msg.pose.position.x
    tf.transform.translation.z = -msg.pose.position.y
    tf.transform.rotation = msg.pose.orientation

    br.sendTransform(tf)

if __name__ == '__main__':
    rospy.init_node('vslam_tf_broadcaster')
    rospy.Subscriber('/orb_slam3/camera_pose',
                     PoseStamped,
                     get_orb_slam_camera_pose)
    rospy.loginfo(rospy.get_name() + ' started!')
    rospy.spin()
