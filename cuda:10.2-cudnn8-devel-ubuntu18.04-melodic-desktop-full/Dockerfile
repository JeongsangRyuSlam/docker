# 기본 이미지 설정
FROM jeongsangryuslam/cuda:10.2-cudnn8-devel-ubuntu18.04

# ROS Melodic 설치를 위한 환경 변수 설정
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 타임존 설정 변경 (Asia/Seoul로 설정)
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ROS 및 CUDA 공개 키 추가
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# RUN curl -s https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add -

# ROS Melodic 설치를 위한 소스 추가
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'

# 직접 CUDA 공개 키 다운로드 및 추가
RUN curl -s https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub -o /tmp/cuda-repo-public-key.asc \
    && apt-key add /tmp/cuda-repo-public-key.asc \
    && rm /tmp/cuda-repo-public-key.asc

# ROS Melodic 설치
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# bashrc에 ROS Melodic 소스 추가
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc



# 사용자의 쉘을 bash로 설정
SHELL ["/bin/bash", "-c"]
