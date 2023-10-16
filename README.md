# ROS2 tutorial

## Prerequisites

- ubuntu 22.04 (recommended)
- [docker](https://docs.docker.com/get-docker/)

## Install

Environments:
- [wsl2](#wsl)
- [ubuntu / VM](#virtual-machine)
- [MacOS](#macos)

### WSL


1. 開啟 WSL2 的 GUI 功能：https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps#install-support-for-linux-gui-apps
2. 允許 docker 連接 X server
    ```sh
    xhost +local:docker
    ```
3. 執行 container
    ```sh
    docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -it --rm osrf/ros:humble-desktop
    ```
4. 在 container 內執行以下指令，可以跑出 TurtleSim 的視窗代表成功
    ```sh
    ros2 run turtlesim turtlesim_node
    ```
    ![](https://hackmd.io/_uploads/Skfh-IFbT.png)

### Virtual Machine

同上面的 step 2~4

### MacOS

(待測試)

## Utils

這邊是方便大家執行 ros2 container 的指令

### Setup

1. 建立一個 ROS workspace
    ```sh
    mkdir -p /path/to/your/workspace/src
    ```
    e.g.
    ```sh
    mkdir -p ~/demo_ws/src
    ```
2. 將下面兩行加入 `~/.bashrc`
    ```sh
    export PATH=$PATH:/path/to/this/repo/scripts
    export DEMO_WS=/path/to/your/workspace
    ```
    e.g.
    ```sh
    export PATH=$PATH:$HOME/orca_docker/scripts
    export DEMO_WS=$HOME/demo_ws
    ```
3. 重新 source `~/.bashrc`
    ```sh
    source ~/.bashrc
    ```
4. Build docker image
   ```
   docker build -f Dockerfile -t orca_ros2 .
   ```

### Usage

- 在 container 裡執行任何 command (若 container 不存在則會幫你 run 一個新的)
    ```sh
    up <command>
    ```
    e.g.
    ```sh
    # 執行 bash
    up bash
    # 執行 turtlesim
    up ros2 turtlesim turtlesim_node
    ```
