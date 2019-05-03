#region Base variables

movement_speed = 7; //Player movement speed. Default: 4;
air_speed = 7; //Player movement speed in the air. Default 7;
fric = 0.3; //Friction (how much you control the player on the ground)
air_friction = 0.1; //Friction in the air (how much you control the player in the air)
grav = 0.5; //Gravity
maxfall = 15; //base max fallspeed
jump = false;
jump_height = 15;
shorthop = 10;
running = false;
runOk = true;
lasthaxis = 0;
lasthaxis2 = 0;
lasthaxis3 = 0;
stopalarm = true;
spd_wanted = 0;
old_fric = fric;
ground_speed = movement_speed;

//Input
haxis = 0;

//DO NOT CHANGE THESE, used for collision
speed_x = 0;
speed_y = 0;
depth = 0;

enemy_hit = 0;
iframes = 0;
death_timer = 0;
only_once = false;
dash = false;
dash_timer = 0;
dash_xpos = 0;
dash_ypos = 0;
dash_count = 0;
jumpsquat = false;
grounded = false;
sh = false; //shorthop
dj = true; //Wether or not doublejump is available


#endregion