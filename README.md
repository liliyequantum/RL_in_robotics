
## This repository is for ASU EEE 598 RL in robotics based on code from [navbot_ppo](https://github.com/hamidthri/navbot_ppo)

## Requirements
- ROS Noetic
- Ubuntu 20.04
- python 3.8.10
- pytorch 1.10.

## Modifications

- The 8x8 env to the 4x4 size for the beginners
- Modify the DDPG training process to make the fair comparison with PPO
- Adjust the exploration noise for DDPG to avoid only rotation of the robot
- Fixed some bugs for smooth running
