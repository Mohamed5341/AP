# Controllers

Controlling this system uses multiple control loop, each loop has one input and one output.

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
| Boeing747 |        2         |       $K_P$       | 0.00082979 |
|           |                  | $\frac{K_I}{K_P}$ |   0.1388   |
|           |                  |       $K_D$       | 0.0013795  |


# Yaw Damper Controller

Here is block diagrams

![Yaw Block Diagram](../Images/YawBD.svg)

Here, we have input is **roll rate** and output is **roll**.

![Yaw Controller](../Images/YawController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_D$   |   2.0089   |
|           |                  |   $K_W$   |  0.09856   |


**Note**: washout here acts as high pass filter. which passes only high frequencies, this makes control over oscillations only. 

# Roll Controller

Here is block diagrams

![Roll Block Diagram](../Images/RollBD.svg)

Here, we have input is **Aliron Angle** required and output is **roll angle**.

![Yaw Controller](../Images/RollController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_D$   |   0.5255   |
|           |                  |   $K_P$   |  4.0438   |