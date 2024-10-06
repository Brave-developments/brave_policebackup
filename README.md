**Features of the Script**

Script Made and Promoted by Brave_developments https://www.youtube.com/@Bravedevelopment   

Script Support Community CODEIN https://discord.gg/bAkQpsYrhy


**Installation**
Download or clone the resource into your server's resources folder.
Add the following line to your server.cfg to ensure the resource is loaded: ensure police-waypoint
If you are using InteractSound, copy the sound files from the install sound folder (inside this resource) to your standalone/interact-sound/client/html/sounds directory.
The sound files should be named:
code1.ogg (Foot Pursuit)
code2.ogg (Vehicle Pursuit)
code3.ogg (Armed Robbery)
code99.ogg (Heavy 10-10)

**Future Plan**
Add support for Different language Audio
Add Support for Different Locale


**Request Police Backup**

Allows police officers to request backup for different scenarios with custom keybinds.
Backup requests include:
Code 1: Foot Pursuit
Code 2: Vehicle Pursuit
Code 3: Armed Robbery
Code 99: Heavy 10-10 (Serious armed incidents)

**Custom Notifications:**

The script supports three types of notifications, depending on what system is available:
qb-notify
ox_lib 
okokNotify
If none are available, a fallback to chat message is used.

**Custom Keybindings**

Officers can trigger backup requests with predefined keybinds:
HOME: Requests Code 1 (Foot Pursuit)
INSERT: Requests Code 2 (Vehicle Pursuit)
PAGEUP: Requests Code 3 (Armed Robbery)
END: Requests Code 99 (Heavy 10-10)
Keybindings can be easily changed in the Fivem Keybinding settings in Game.

**Custom Sounds**

Plays a unique sound for each type of backup request (using InteractSound).
Sounds include:
code1.ogg for Foot Pursuit.
code2.ogg for Vehicle Pursuit.
code3.ogg for Armed Robbery.
code99.ogg for Heavy 10-10.

**Customization:**
Keybindings: Can be adjusted easily to match preferred keys.
Notification System: Works with multiple notification systems, ensuring flexibility across different server setups.
Sound Files: Custom sounds can be easily swapped by changing the sound file names in the client script and ensuring the appropriate sound files are included in the server.

**Dependencies**

QBCore: This script is built for the QBCore framework.
InteractSound: Used for playing the alert sounds.
Notification Systems (Optional): Supports qb-notify, ox_lib, and okokNotify.
