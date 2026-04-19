# ROS2 Humble NVIDIA Docker Template

> A ready-to-use Docker development environment for ROS2 Humble with full NVIDIA GPU acceleration, Gazebo simulation, RViz2 visualization, and TurtleBot3 support.

---

## Overview

This template gives you a fully configured ROS2 Humble workspace inside Docker — no manual ROS installation needed. GPU passthrough is handled automatically via the NVIDIA Container Toolkit, and your local workspace is mounted into the container so you can edit files with your preferred editor on the host and see changes reflected instantly.

**Included out of the box:**

| Feature | Details |
|---|---|
| ROS2 Distribution | Humble Hawksbill |
| GPU Support | NVIDIA via Container Toolkit |
| Simulation | Gazebo |
| Visualization | RViz2 |
| Robot Model | TurtleBot3 (Burger) |
| Example Package | Publisher / Subscriber (`pubsub_pkg`) |
| Workspace Mount | `./ros2_ws` ↔ `/ros2_ws` |

---

## Prerequisites

Ensure the following are installed and configured on your host machine before proceeding:

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- NVIDIA GPU drivers
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- Linux desktop environment (required for GUI applications)

---

## Renaming This Project

When you create a repository from this template on GitHub, you can give it any name you like — for example:

```
my-ros2-project
robotics-lab
ros2-dev-workspace
```

If you also want to rename the Docker container and image, open `docker-compose.yml` and update the `container_name` and image fields to match your project name. This keeps things consistent across your codebase.

---

## Getting Started

### 1. Create your repository

On GitHub, click **"Use this template"** → **"Create a new repository"** and fill in your project name.

### 2. Clone your repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 3. Allow GUI forwarding

Run this command after every login or reboot (required for Gazebo, RViz2):

```bash
xhost +local:docker
```

### 4. Build the Docker image

```bash
docker compose build
```

### 5. Start the container

```bash
docker compose up -d
```

### 6. Enter the container

```bash
docker exec -it ros2_ws_container bash
```

---

## Building the Workspace

Inside the container, run:

```bash
cd /ros2_ws
colcon build
source install/setup.bash
```

---

## Running the Example Package

Start the publisher in one terminal:

```bash
ros2 run pubsub_pkg publisher
```

Open a second terminal and attach to the container:

```bash
docker exec -it ros2_ws_container bash
ros2 run pubsub_pkg subscriber
```

---

## Launching Simulation Tools

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

**TurtleBot3 in Gazebo:**

```bash
docker exec -it ros2_ws_container bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

---

## Common Commands

| Action | Command |
|---|---|
| Start container | `docker compose up -d` |
| Enter container | `docker exec -it ros2_ws_container bash` |
| Stop container | `docker compose down` |
| Rebuild image | `docker compose build` |

---

## Pushing Changes to GitHub

After making changes to your project:

```bash
git add .
git commit -m "your commit message"
git push
```

**First-time push on a new repository:**

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

---

## Workspace Structure

```
ros2-humble-nvidia-docker-template/
├── docker-compose.yml
├── Dockerfile
├── ros2_ws/
│   └── src/
│       └── pubsub_pkg/
└── README.md
```

Files edited on your **host** at `./ros2_ws` are immediately available inside the container at `/ros2_ws` — no rebuild required.

---

## Author

**Vignesh Suresh**

---

*Built on ROS2 Humble · Dockerized · GPU-ready*