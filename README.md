# Fanuc CR-35iA mock system using ros2_control
This repository provides a mock system of a Fanuc CR-35iA robot made possible using the ros2_control framework.

## Prerequisites
### 1. **Ubuntu 22.04**
This project is designed to run on **Ubuntu 22.04**.

### 2. **ROS 2 Humble**
This project is built on **ROS 2 Humble**. If you haven't installed ROS 2 Humble yet, follow the official installation guide:

- [ROS 2 Humble Installation Guide for Ubuntu](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html)

Once ROS 2 is installed, remember to source the ROS 2 environment:
```bash
source /opt/ros/humble/setup.bash
```

### 3. **Required ROS 2 Packages**

The project relies on the following ROS 2 packages:

#### **ros2_control**
This package allows the usage of controllers necessary to move the mock system.

Install it with:
```bash
sudo apt install ros-humble-ros2-control ros-humble-ros2-controllers
```


## Creating the Project

### 1. **Create a Workspace**
Create a new workspace:
```bash
mkdir -p ~/das_r2c_ws/src
```

### 2. **Clone the Repository**
Next, clone the repository into the newly created workspace:
```bash
cd ~/das_r2c_ws/src
git clone https://github.com/nikolaakrap/das_r2c.git
```

### 3. **Install Dependencies**
Before building the workspace, you'll need to install all the necessary dependencies:
```bash
cd ~/das_r2c_ws
sudo apt-get update
rosdep update --rosdistro=$ROS_DISTRO
rosdep install --from-paths ./ -i -y --rosdistro ${ROS_DISTRO}
```

### 4. **Build and Source the Workspace**
Now, build and source the workspace:
```bash
colcon build --symlink-install
source install/setup.bash
```

## Running the project
The project has two main modes of running. The user can manually jog each joint of the robot via a GUI or they can publish movements to the robot controllers.

### 1. **Manually controlling the robot**
In order to manually control the robot through a GUI launch the following command **(remember to build and source the workspace)**:
```bash
ros2 launch das_r2c view_cr35ia.launch.py
```
This will launch RViz with the robot inside it as well as a GUI for manipulating each of the robot joints.

### 2. **Publishing movements via controllers**
If the user opts for publishing movements to the robot controllers it is necessary to first launch the robot with it's controllers. For this, run the following command **(remember to build and source the workspace)**:
```bash
ros2 launch das_r2c cr35ia.launch.py
```
This will launch RViz with the robot inside it. The robot is launched with the forward\_position\_controller activated and the joint\_trajectory\_controller deactivated.
The list of all controllers can be seen from a separate terminal window with the command:
```bash
ros2 control list_controllers
```

**BE CAREFUL**

It is not possible for both the forward\_position\_controller and the joint\_trajectory\_controller. If you want to, for example, deactivate the forward\_position\_controller and activate the joint\_trajectory\_controller run the following command in a separate terminal window:
```bash
ros2 control switch_controllers --activate joint_trajectory_position_controller --deactivate forward_position_controller
```
Take not of this before publishing commands to the controllers.


To publish commands to the forward\_position\_controller run the command:
```bash
ros2 launch das_r2c cr35ia_forward_position_controller.launch.py
```

To publish commands to the joint\_trajectory\_controller run the command:
```bash
ros2 launch das_r2c cr35ia_joint_trajectory_controller.launch.py
```
