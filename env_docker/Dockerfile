FROM osrf/ros:humble-desktop
LABEL maintainer="Ryohei Kobayashi <kobayashi.ryohei621@mail.kyutech.jp>"

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    wget \
    vim \
    lsb-release \
    build-essential \
    cmake \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-pip \
    ros-humble-rmw-cyclonedds-cpp \
    libpcl-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /ros2_ws/src

RUN cd /ros2_ws/src/ && git clone -b $ROS_DISTRO https://github.com/rt-net/sciurus17_ros.git
RUN cd /ros2_ws/src/ && git clone -b $ROS_DISTRO https://github.com/rt-net/sciurus17_description.git

RUN apt update -y && rosdep update 
RUN rosdep install -r -y -i --from-paths .

COPY ./additional_rospkgs/ /ros2_ws/src/additional_rospkgs/

RUN cd /ros2_ws && \
    . /opt/ros/humble/setup.sh && \
    colcon build --symlink-install

RUN . /opt/ros/humble/setup.sh && \
    . /ros2_ws/install/setup.sh

COPY ./assets/cyclonedds_profile.xml /ros2_ws/cyclonedds_profile.xml
COPY ./assets/entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT [ "/ros_entrypoint.sh" ]

WORKDIR /ros2_ws

