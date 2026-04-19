# ROS2 Humble Docker Template

## Features
- ROS2 Humble
- Gazebo
- RViz2
- TurtleBot3
- NVIDIA GPU Support
- Example Publisher/Subscriber Package

## Run

xhost +local:docker
docker compose up --build -d
docker exec -it ros2_ws_container bash

## Build Workspace

cd /ros2_ws
colcon build
source install/setup.bash

## Run Example

ros2 run pubsub_pkg publisher
ros2 run pubsub_pkg subscriber