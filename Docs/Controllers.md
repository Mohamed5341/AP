# Controllers

Controlling this system uses multiple control loop, each loop has one input and one output.

# Pitch Controller

For pitch controlling, Here is the system block diagram.

![Pitch Block Diagram](../Images/PitchBD.svg)

Here we have input is **Elevator** and output is **Pitch Angle**. Adding controller to this system.

![Pitch Controller](../Images/PitchController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_P$   |   1.9341   |
|           |                  |   $K_I$   |   1.0704   |
|           |                  |   $K_D$   |   2.0388   |


# Velocity Controller

Here is system block diagram.

![Velocity Block Diagram](../Images/VelocityBD.svg)

Here, we have input is **Thrust** and output is velocity.

![Velocity Controller](../Images/VelocityController.svg)

Here is gain values

| Aircraft  | Flight Condition | Gain Name | Gain Value |
| :-------: | :--------------: | :-------: | :--------: |
| Boeing747 |        2         |   $K_P$   |  767.1819  |
|           |                  |   $K_I$   |  13.7790   |
|           |                  |   $K_D$   |   2184.6   |
|           |                  | $K_{ZD}$  |    0.1     |
|           |                  | $K_{PD}$  |   0.1454   |

# Control Gains

Here is all control gains for all control loops.

| Control Loop |         Input         |  output  | Gain name | Gain value |
| :----------: | :-------------------: | :------: | :-------: | :--------: |
|    Pitch     | $\theta_{\text{com}}$ | $\theta$ |           |            |
|              |                       |          |    KP     |   1.9341   |
|              |                       |          |    KI     |   1.0704   |
|              |                       |          |    KD     |   2.0388   |