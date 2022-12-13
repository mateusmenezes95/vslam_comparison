#!/usr/bin/env python3

import rospy

import tf2_ros
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped, TransformStamped, Quaternion


def get_orb_slam_camera_pose(msg: PoseStamped):
    br = tf2_ros.TransformBroadcaster()
    tf = TransformStamped()

    tf.header.stamp = rospy.Time.now()
    tf.header.frame_id = "map"
    tf.child_frame_id = "vslam_camera_aligned"
    tf.transform.translation.x = msg.pose.position.z
    tf.transform.translation.y = -msg.pose.position.x
    tf.transform.translation.z = -msg.pose.position.y

    # The pitch rotation in camera frame is the yaw rotation in map frame
    q_in = msg.pose.orientation
    euler_in = euler_from_quaternion([q_in.x, q_in.y, q_in.z, q_in.w])
    q_out = quaternion_from_euler(0, 0, -euler_in[1])
    q = Quaternion()
    q.x = q_out[0]
    q.y = q_out[1]
    q.z = q_out[2]
    q.w = q_out[3]

    tf.transform.rotation = q

    br.sendTransform(tf)

if __name__ == '__main__':
    rospy.init_node('vslam_tf_broadcaster')
    rospy.Subscriber('/orb_slam3/camera_pose',
                     PoseStamped,
                     get_orb_slam_camera_pose)
    rospy.loginfo(rospy.get_name() + ' started!')
    rospy.spin()
