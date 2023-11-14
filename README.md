# Orca AUV ROS2 environment

> [!NOTE]
> (2023/11/14) Please make sure you set the environment variables correctly (there are some updates in the latest commits)

## Prerequisites

- ubuntu 22.04 (recommended)
- [docker](https://docs.docker.com/get-docker/)

## Install

1. Download the repository

    ```sh
    mkdir -p ~/workspaces/ros2_ws/src
    cd ~/workspaces/ros2_ws/src
    git clone git@github.com:NCTU-AUV/orca_docker.git
    ```

2. Setup an env variable to your workspace

    ```sh
    export ROS2_WS=$HOME/workspaces/ros2_ws
    ```

3. Enable GUI application in docker (optional)

   ```
   xhost +local:docker
   ```

4. The up script build the image and start the container for you, or attach to the container if there is one running.

    ```sh
    cd ~/workspaces/ros2_ws/src/orca_docker
    ./scripts/up
    ```
    note: you can add an alias to this command or add scripts to PATH for convenience
