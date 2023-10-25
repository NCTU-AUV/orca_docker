FROM osrf/ros:humble-desktop

RUN apt update && apt install python3-pip vim -y
RUN pip3 install setuptools==58.2.0
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /root/.bashrc
RUN echo "source /demo_ws/install/setup.bash" >> /root/.bashrc

WORKDIR /demo_ws
