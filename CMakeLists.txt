cmake_minimum_required(VERSION 3.0.2)
project(vslam_comparison)

find_package(catkin REQUIRED COMPONENTS)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

catkin_package()

## Mark other files for installation (e.g. launch and bag files, etc.)
install(
  DIRECTORY launch config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
