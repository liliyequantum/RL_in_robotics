## ASU EEE 598: Reinforcement Learning in Robotics
This repository contains code for the ASU course EEE 598: Reinforcement Learning in Robotics. It is based on code from GitHub: [navbot_ppo](https://github.com/hamidthri/navbot_ppo)
![PPO in the Gazebo env](example.gif)

## Requirements

- **ROS Noetic**
- **Ubuntu 20.04**
- **Python 3.8.10**
- **PyTorch 1.10**

## Modifications

This project includes the following modifications to the original code:

- **Environment Scaling**: Reduced the environment from an 8x8 grid to a 4x4 grid, making it more suitable for beginners.
- **Training Process Adjustment**: Modified the DDPG training process to ensure a fair comparison with PPO.
- **Exploration Noise Adjustment**: Tuned the exploration noise for DDPG to prevent the robot from only rotating in place.
- **Bug Fixes**: Addressed and fixed various bugs for smoother operation.

