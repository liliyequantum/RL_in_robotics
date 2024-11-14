# Start from Ubuntu 20.04
FROM ubuntu:20.04

# Set environment variables for non-interactive installation and ROS
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=noetic

# Update and install basic dependencies
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    curl \
    lsb-release \
    gnupg \
    git \
    python3-pip \
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Add ROS Noetic source and install ROS Noetic base
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add - && \
    apt-get update && \
    apt-get install -y ros-noetic-desktop-full && \
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Install Gazebo and related dependencies
RUN apt-get update && \
    apt-get install -y \
    gazebo11 \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-plugins \
    ros-noetic-navigation \
    ros-noetic-tf && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies and necessary libraries
RUN python3.8 -m pip install --upgrade pip && \
    python3.8 -m pip install \
    torch==1.10 \
    numpy \
    gym \
    rospkg \
    catkin-tools \
    matplotlib

# Set up catkin workspace
RUN mkdir -p /root/catkin_ws/src && \
    cd /root/catkin_ws && \
    /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make"

# Copy project code and build
COPY . /root/catkin_ws/src/your_project
RUN cd /root/catkin_ws && \
    /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make"

# Set entry point to bash
ENTRYPOINT ["/bin/bash"]
