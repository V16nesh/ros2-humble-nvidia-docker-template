FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-argcomplete \
    git \
    nano \
    vim \
    x11-apps \
    mesa-utils \
    gazebo \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-turtlebot3 \
    ros-humble-turtlebot3-gazebo \
    ros-humble-rviz2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ros2_ws

CMD ["bash"]