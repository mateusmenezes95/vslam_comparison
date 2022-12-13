#!/usr/bin/env python3

from os import path

import rospy
import rosservice
import rospkg

from nav_msgs.msg import Path
from hector_nav_msgs.srv import GetRobotTrajectory, GetRobotTrajectoryResponse, GetRobotTrajectoryRequest
from vslam_comparison.srv import SavePath, SavePathResponse, SavePathRequest

rospack = rospkg.RosPack()
THIS_PACKAGE_PATH = rospack.get_path('vslam_comparison')
EVALUATION_FILES_PATH = 'evaluation'

def save_trajectory(data: GetRobotTrajectoryResponse, filename: str) -> str:
    filepath = path.join(THIS_PACKAGE_PATH, EVALUATION_FILES_PATH, filename)
    filepath = filepath + ".txt"
    with open(filepath, mode='w', encoding='utf-8') as trajectory_file:
        trajectory_file.write("#timestamp,tx,ty,tz,qx,qy,qz,qw\n")
        for pose in data.trajectory.poses:
            trajectory_file.write(str(pose.header.stamp) + ',' +
                str(pose.pose.position.x) + ',' +
                str(pose.pose.position.y) + ',' +
                str(pose.pose.position.z) + ',' +
                str(pose.pose.orientation.x) + ',' +
                str(pose.pose.orientation.y) + ',' +
                str(pose.pose.orientation.z) + ',' +
                str(pose.pose.orientation.w) + '\n'
            )
    return filepath

def handle_save_path_call(req: SavePathRequest) -> SavePathResponse:
    rospy.loginfo('Received request to save the path ' + req.path + " with name: " + req.filename + ".txt")

    services_available = rosservice.get_service_list()
    if (req.path not in services_available):
        return SavePathResponse(False, 'Service to get ' + req.path + ' does not exists!')

    try:
        path_request = rospy.ServiceProxy(req.path, GetRobotTrajectory)
        path_response = path_request(GetRobotTrajectoryRequest())
        filepath = save_trajectory(path_response, req.filename)
        return SavePathResponse(True, filepath)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s"%e)
        return SavePathResponse(False, str(e))

if __name__ == "__main__":
    rospy.init_node('save_path')
    srv_server = rospy.Service('save_path', SavePath, handle_save_path_call)
    print(rospy.get_name() + ' has started!')
    rospack = rospkg.RosPack()
    rospy.spin()
