#region Create game object if it doesn't exist to avoid crashing
if !instance_exists(obj_game)
{
	instance_create_depth(x,y,0,obj_game);	
}
#endregion

#region Base variables

movement_speed = 7; //Player movement speed. Default: 4;
air_speed = 7; //Player movement speed in the air. Default 7;
fric = 0.3; //Friction (how much you control the player on the ground)
air_friction = 0.1; //Friction in the air (how much you control the player in the air)
grav = 0.5; //Gravity
maxfall = 15; //base max fallspeed
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

//DO NOT CHANGE THESE, used for collision
speed_x = 0;
speed_y = 0;
depth = 0;

enemy_hit = 0;
iframes = 0;
death_timer = 0;
only_once = false;
jump = false;
dash = false;
dash_timer = 0;
dash_xpos = 0;
dash_ypos = 0;
dash_count = 0;
jumpsquat = false;
wave_dash_timer = 0;
sh = false; //shorthop
dj = true; //Wether or not doublejump is available
ff = false; //fastfalling

execute_press = 0;
execute_timer = 0;
//attack = "none";
attack_light_length = 10; //In amount of frames (60fps)
attack_light_timer = 0;

facing = "right";

#endregion