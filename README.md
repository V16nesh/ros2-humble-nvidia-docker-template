# ROS2 Humble NVIDIA Docker Template

A Docker setup for ROS2 Humble with NVIDIA GPU support, Gazebo, RViz2, and TurtleBot3. The goal is to get a working ROS2 environment running with minimal effort.

## What's Inside

- ROS2 Humble Hawksbill
- NVIDIA GPU support via Container Toolkit
- Gazebo simulation
- RViz2
- TurtleBot3 (Burger)
- A basic publisher/subscriber package (`pubsub_pkg`) to test things out
- Mounted workspace so edits on your host show up in the container immediately

## Requirements

You need these installed on your machine before starting:

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- NVIDIA GPU drivers
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- Linux with a desktop (needed for Gazebo and RViz2)

## Renaming the Project

When using this template on GitHub, just name your repo whatever makes sense for your project. After cloning, if you want to rename the container too, open `docker-compose.yml` and change the `container_name` and image name fields.

## Setup

**1. Use this template on GitHub**

Click "Use this template" and create your own repo.

**2. Clone it**

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

**3. Allow GUI apps (do this after every login)**

```bash
xhost +local:docker
```

**4. Build the image**

```bash
docker compose build
```

**5. Start the container**

```bash
docker compose up -d
```

**6. Enter the container**

```bash
docker exec -it ros2_ws_container bash
```

## Build the Workspace

Inside the container:

```bash
cd /ros2_ws
colcon build
source install/setup.bash
```

## Run the Example Nodes

Terminal 1:

```bash
ros2 run pubsub_pkg publisher
```

Terminal 2:

```bash
docker exec -it ros2_ws_container bash
ros2 run pubsub_pkg subscriber
```

## Simulation

**Gazebo:**

```bash
docker exec -it ros2_ws_container bash
gazebo
```

**RViz2:**

```bash
docker exec -it ros2_ws_container bash
rviz2
```

**TurtleBot3:**

```bash
docker exec -it ros2_ws_container bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

## Daily Use

Start:
```bash
docker compose up -d
```

Enter:
```bash
docker exec -it ros2_ws_container bash
```

Stop:
```bash
docker compose down
```

## Project Structure

```
ros2-humble-nvidia-docker-template/
├── docker-compose.yml
├── Dockerfile
├── ros2_ws/
│   └── src/
│       └── pubsub_pkg/
└── README.md
```

The `ros2_ws` folder is mounted, so any file you edit on your host is live inside the container without rebuilding.


## Author

Vignesh Suresh