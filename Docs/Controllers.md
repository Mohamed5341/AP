# Controllers

Control here is over two things **Altitude**(longitudinal) and **Yaw Angle**(lateral). This is done by using multiple control loop, each loop has one input and one output.

![NL Simulator blocks](../Images/NLSimBD.svg)

1. Longitudinal 
   1. [Pitch controller](#pitch-controller)
   2. [Velocity controller](#velocity-controller)
   3. [Altitude controller](#altitude-controller)
2. Lateral
   1. [Yaw Damper controller](#yaw-damper-controller)
   2. [Roll controller](#roll-controller)
   3. [Yaw controller](#coordination)

# Pitch Controller

For pitch controlling, Here is the system block diagram.

![Pitch Block Diagram](../Images/PitchBD.svg)

Here we have input is **Elevator** and output is **Pitch Angle**. Adding controller to this system.

![Pitch Controller](../Images/PitchController.svg)

Here is gain values

| Aircraft  | Flight Condition |     Gain Name     | Gain Value |
| :-------: | :--------------: | :---------------: | :--------: |
| Boeing747 |        2         |       $K_P$       |   1.631    |
|           |                  | $\frac{K_I}{K_P}$ |   0.6421   |
|           |                  |       $K_D$       |   1.4495   |


# Velocity Controller

Here is system block diagram.

![Velocity Block Diagram](../Images/VelocityBD.svg)

Here, we have input is **Thrust** and output is velocity.

![Velocity Controller](../Images/VelocityController.svg)

Here is gain values

| Aircraft  | Flight Condition |     Gain Name     | Gain Value |
| :-------: | :--------------: | :---------------: | :--------: |
| Boeing747 |        2         |       $K_P$       |   129.86   |
|           |                  | $\frac{K_I}{K_P}$ |  0.08971   |
|           |                  |       $K_D$       |   23265    |
|           |                  |     $K_{ZD}$      |    0.1     |
|           |                  |     $K_{PD}$      |   1.831    |

# Altitude Controller

Here is block diagrams

![Altitude Block Diagram](../Images/AltitudeBD.svg)

Here, we have input is **Pitch Angle** and output is **Altitude**.

![Altitude Controller](../Images/AltitudeController.svg)

Here is gain values

| Aircraft  | Flight Condition |     Gain Name     | Gain Value |
| :-------: | :--------------: | :---------------: | :--------: |
| Boeing747 |        2         |       $K_P$       | 0.00092474 |
|           |                  | $\frac{K_I}{K_P}$ |  0.02901   |
|           |                  |       $K_D$       | 0.00027689 |


# Yaw Damper Controller

Here is block diagrams

![Yaw Block Diagram](../Images/YawBD.svg)

Here, we have input is **roll rate** and output is **roll**.

![Yaw Controller](../Images/YawController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_D$   |   3.0936   |
|           |                  |   $K_W$   |    0.2     |


**Note**: washout[$^{[1]}$](#references)[$^{[2]}$](#references) here acts as high pass filter. which passes only high frequencies, this makes control over oscillations only. 

# Roll Controller

Here is block diagrams

![Roll Block Diagram](../Images/RollBD.svg)

Here, we have input is **Aliron Angle** required and output is **roll angle**.

![roll Controller](../Images/RollController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_D$   |   0.5255   |
|           |                  |   $K_P$   |  4.0438   |

# Coordination

To achieve coordination[$^{[2]}$](#references), adding controller over yaw angle, from equilibruim equations get the final formula for controller.

![Coordination Controller](../Images/coordinationController.svg)

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        -         |  $\tau$   |     15     |

# References

[1] Etkin, B., &amp; Reid, L. D. (1996). Dynamics of flight: Stability and control. Wiley. 

[2] MIT Course (Aircraft Stability And Control) notes ([link](https://ocw.mit.edu/courses/16-333-aircraft-stability-and-control-fall-2004/))