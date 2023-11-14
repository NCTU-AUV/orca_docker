#!/bin/bash

IMAGE_NAME=orca_ros2
docker build -f Dockerfile -t "${IMAGE_NAME}" "${ROS2_WS}"
