# # Start from Ubuntu 20.04
# FROM ubuntu:20.04

# # Set environment variables for non-interactive installation and ROS
# ENV DEBIAN_FRONTEND=noninteractive
# ENV ROS_DISTRO=noetic

# # Update and install basic dependencies
# RUN apt-get update && \
#     apt-get install -y \
#     software-properties-common \
#     curl \
#     lsb-release \
#     gnupg \
#     git \
#     python3-pip \
#     python3.8 \
#     python3.8-dev \
#     python3.8-distutils \
#     wget && \
#     rm -rf /var/lib/apt/lists/*

# # Add ROS Noetic source and install ROS Noetic base
# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
#     curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add - && \
#     apt-get update && \
#     apt-get install -y ros-noetic-desktop-full && \
#     echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# # Install Gazebo and related dependencies
# RUN apt-get update && \
#     apt-get install -y \
#     gazebo11 \
#     ros-noetic-gazebo-ros-pkgs \
#     ros-noetic-gazebo-plugins \
#     ros-noetic-navigation \
#     ros-noetic-tf && \
#     rm -rf /var/lib/apt/lists/*

# # Install Python dependencies and necessary libraries
# RUN python3.8 -m pip install --upgrade pip && \
#     python3.8 -m pip install \
#     torch==1.10 \
#     numpy \
#     gym \
#     rospkg \
#     catkin-tools \
#     matplotlib

# # Set up catkin workspace
# RUN mkdir -p /root/catkin_ws/src && \
#     cd /root/catkin_ws && \
#     /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make"

# # Copy project code and build
# COPY . /root/catkin_ws/src/your_project
# RUN cd /root/catkin_ws && \
#     /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make"

# # Set entry point to bash
# ENTRYPOINT ["/bin/bash"]
#..........................
# # Start from Ubuntu 20.04
# FROM ubuntu:20.04

# # Set environment variables for non-interactive installation and ROS
# ENV DEBIAN_FRONTEND=noninteractive
# ENV ROS_DISTRO=noetic

# # Increase timeout and add retry options
# RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
#     apt-get update -o Acquire::Connection::Timeout=10 -o Acquire::CompressionProxy::Threshold=3 && \
#     apt-get install -y --no-install-recommends \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg-agent \
#     software-properties-common

# # Install basic dependencies with improved network resilience
# RUN apt-get update --fix-missing -o Acquire::Connection::Timeout=10 && \
#     apt-get install -y --no-install-recommends \
#     perl \
#     liberror-perl \
#     libpython3.8-dev \
#     libexpat1-dev \
#     zlib1g-dev \
#     packagekit \
#     gpgv \
#     wget \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Install additional basic dependencies
# RUN apt-get update -o Acquire::Connection::Timeout=10 && \
#     apt-get install -y --no-install-recommends \
#     lsb-release \
#     gnupg \
#     git \
#     python3-pip \
#     python3.8 \
#     python3.8-dev \
#     python3.8-distutils \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Add ROS Noetic repository with retry mechanism
# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
#     for i in 1 2 3; do \
#         curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add - && break; \
#     done && \
#     apt-get update -o Acquire::Connection::Timeout=10 && \
#     apt-get install -y --no-install-recommends \
#     ros-noetic-desktop-full \
#     && echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Install Gazebo and related dependencies with retry
# RUN apt-get update -o Acquire::Connection::Timeout=10 && \
#     apt-get install -y --no-install-recommends \
#     gazebo11 \
#     ros-noetic-gazebo-ros-pkgs \
#     ros-noetic-gazebo-plugins \
#     ros-noetic-navigation \
#     ros-noetic-tf \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies with pip retry
# RUN python3.8 -m pip install --no-cache-dir --upgrade pip && \
#     python3.8 -m pip install --no-cache-dir --retries 3 \
#     torch==1.10 \
#     numpy \
#     gym \
#     rospkg \
#     catkin-tools \
#     matplotlib

# # Set Python3.8 as default
# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

# # Set up catkin workspace
# RUN mkdir -p /root/catkin_ws/src && \
#     cd /root/catkin_ws && \
#     /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make" || true

# # Copy project code to workspace
# COPY . /root/catkin_ws/src/your_project

# # Build the workspace
# RUN cd /root/catkin_ws && \
#     /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make" || true

# # Set entry point to bash
# ENTRYPOINT ["/bin/bash"]



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
    gnupg2 \
    git \
    python3-pip \
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    wget \
    ca-certificates \
    apt-transport-https && \
    rm -rf /var/lib/apt/lists/*

# Add ROS Noetic source and install ROS Noetic base
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full && \
    echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc && \
    echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

# Initialize rosdep
RUN apt-get update && \
    apt-get install -y python3-rosdep && \
    rosdep init && \
    rosdep update

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
RUN python3.8 -m pip install --no-cache-dir --upgrade pip && \
    python3.8 -m pip install --no-cache-dir \
    torch==1.10 \
    numpy \
    gym \
    rospkg \
    catkin-tools \
    matplotlib

# Set up catkin workspace
RUN mkdir -p /root/catkin_ws/src && \
    cd /root/catkin_ws && \
    bash -c "source /opt/ros/noetic/setup.bash && catkin_make" || true

# Copy project code and build
COPY . /root/catkin_ws/src/your_project
RUN cd /root/catkin_ws && \
    bash -c "source /opt/ros/noetic/setup.bash && catkin_make" || true

# Set entry point to bash
ENTRYPOINT ["/bin/bash"]