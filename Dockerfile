FROM osrf/ros:humble-desktop

ARG USERNAME=admin
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG ROS_WS=/workspaces/ros2_ws

WORKDIR $ROS_WS

COPY src ${ROS_WS}/src

# setup non-root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# install python3-pip
RUN apt-get install -y python3-pip \
    && pip3 install setuptools==58.2.0

# other utilities tools
RUN apt-get install -y vim

# install ros packages dependencies
RUN rosdep update \
    && rosdep install --from-path src --ignore-src -r -y

RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /home/$USERNAME/.bashrc
RUN echo "source ${ROS_WS}/install/setup.bash" >> /home/$USERNAME/.bashrc
RUN echo "source /usr/share/gazebo/setup.bash" >> /home/$USERNAME/.bashrc
RUN echo "alias build='colcon build --symlink-install'" >> /home/$USERNAME/.bashrc

USER $USERNAME
