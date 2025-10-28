#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source /ros2_ws/install/setup.bash

# Set Cyclone DDS
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file:///ros2_ws/cyclonedds_profile.xml

# allowing access to the usb device 
exec "$@"
