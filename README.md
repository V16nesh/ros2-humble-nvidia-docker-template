# ROS2 Humble NVIDIA Docker Template

A simple Docker setup for ROS2 Humble with GPU support, Gazebo, RViz2, and TurtleBot3. Clone it, build it, and start working.

---

## What's included

- ROS2 Humble
- NVIDIA GPU support
- Gazebo simulation
- RViz2
- TurtleBot3
- A simple publisher / subscriber example package
- Mounted workspace (edit files on your host, changes show up in the container instantly)

---

## Requirements

Make sure you have these installed on your machine before starting:

- Docker
- Docker Compose
- NVIDIA drivers
- NVIDIA Container Toolkit
- Linux with a desktop (for GUI apps like Gazebo and RViz2)

---

## How to rename this project

When you use this template on GitHub, you can name your repo whatever you want — for example:

```
my-ros2-project
robotics-lab
ros2-dev-workspace
```

After cloning, if you also want to rename the container name (currently `ros2_ws_container`), just open `docker-compose.yml` and change the `container_name` field to whatever you prefer. Same goes for the image name.

---

## Getting started

### 1. Use this template on GitHub

Click **"Use this template"** on the GitHub page and create your own repo.

### 2. Clone your repo

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 3. Allow GUI apps (run this after every login)

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

## Build and run the workspace

Inside the container:

```bash
cd /ros2_ws
colcon build
source install/setup.bash
```

### Run the example publisher

```bash
ros2 run pubsub_pkg publisher
```

Open a second terminal and run the subscriber:

```bash
docker exec -it ros2_ws_container bash
ros2 run pubsub_pkg subscriber
```

---

## Launch Gazebo, RViz2, or TurtleBot3

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

---

## Daily commands

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

---

## Saving your work to GitHub

After making changes:

```bash
git add .
git commit -m "describe what you changed"
git push
```

If it's your first push on a new repo:

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

---

## Notes

- Your workspace lives at `./ros2_ws` on your host and `/ros2_ws` inside the container
- Any file you edit on your host shows up inside the container right away — no need to rebuild

---

## Author

Vignesh