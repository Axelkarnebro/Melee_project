scr_controls();
scr_get_grounded();
scr_get_running();
scr_get_attack();

/////////////////////////////////////////////////////
    
#region	Collision + Movement

#region Apply gravity
if speed_y <= maxfall
{
	speed_y += grav;
}

#endregion

var spd_wanted_y = 0; //The wanted horizontal speed for this step

#region set 'spd_wanted' (the requested speed) to itself -/+ the movement speed

if running && grounded = true
{
	sprite_index = spr_player11;
	if haxis < -0.4
	{
		spd_wanted = -movement_speed;
	}
	else if haxis > 0.4
	{
		spd_wanted = movement_speed;
	}
}

if grounded = false
{
	sprite_index = spr_player;
	running = false;
	runOk = true;	
}

if haxis > -0.4 && haxis < 0.4
{
	sprite_index = spr_player;
	spd_wanted = 0;
	running = false;
	runOk = true;
}

#endregion

#region Set 'jump' to 'true' if you press the 'jump-button'
if (execute_pressed) && !place_meeting(x,y-2,obj_solid)
{
	if place_meeting(x,y+2,obj_solid)
	{
		sprite_index = spr_player1; //Show jumpsquat frames
		jumpsquat = true;
		alarm[0] = 5; //number here is amount of jumpsquat frames
	}
	else
	{
		if dj = true
		{
			jump = true;
			dj = false;
		}
	}
}


#endregion

#region Dashing
if dash = true //&& (grounded || jumpsquat) 
{
	speed_x = dash_xpos;
	speed_y = dash_ypos;
}
#endregion

speed_x += (spd_wanted - speed_x) * fric; //Smoothly accelerate / decelerate to the wanted speed.
speed_y += (spd_wanted_y) * fric; //Smoothly accelerate / decelerate to the wanted speed.

#region Vertical collision

var ysp = round(speed_y); //Turn the theoretical value into an integer for collision and movement (decimals don't work when using pixels as measurement)

if(place_meeting(x, y + ysp, obj_solid))
{
    while(!place_meeting(x, y + sign(ysp), obj_solid))
    {
        y += sign(ysp);
    }
    ysp     = 0
    speed_y = 0; //We still have to set the theoretical value to 0 here
	
}
y += ysp;

if(place_meeting(x, y + 1, obj_solid))
{
	dj = true;
	maxfall = 15;
}

#endregion

#region Horizontal collision

var xsp = round(speed_x); //Turn the theoretical value into an integer for collision and movement

if(place_meeting(x + xsp, y, obj_solid))
{
    while(!place_meeting(x + sign(xsp), y, obj_solid))
    {
        x += sign(xsp);
    }
    xsp     = 0;
    speed_x = 0; //We still have to set the theoretical value to 0 here
}
x += xsp;
#endregion

#endregion

/////////////////////////////////////////////////////

#region Dash

if shift_pressed && dash_count < 1
{
	dash = true;	
}

if dash = true
{
	
	if dash_timer = 1
	{
		dash_count++;
		
		dash_xpos = 12 * haxis;
		dash_ypos = 12 * vaxis;
	}
	
	dash_timer++;
	
	if dash_timer > 10
	{
		dash_timer = 0;
		dash = false;
		dash_xpos = 0;
		dash_ypos = 0;
	}
}

if !(dash_timer > 0) && !grounded
{
	fric = air_friction;	
	movement_speed = air_speed;
}
else
{
	fric = old_fric;	
	movement_speed = ground_speed;
}

if dash_timer > 0
{
	wave_dash_timer++;	
	fric = 0.01;
}

if wave_dash_timer > 0
{
	wave_dash_timer++;
}

if wave_dash_timer > 10
{
	fric = old_fric;
	wave_dash_timer = 0;
}

if grounded = true
{
	dash_count = 0;	
}


#endregion

/////////////////////////////////////////////////////

#region Jumping

if jump = true
{
	speed_y = -jump_height;
	//sprite_index = the sprite used for jumping
	jump = false;
}

if sh = true
{
	speed_y = -shorthop;
	//sprite_index = the sprite used for jumping
	sh = false;
}

#endregion

/////////////////////////////////////////////////////

#region Wall Jumping

if !place_meeting(x,y+2,obj_solid)
{
	if place_meeting(x+1,y,obj_solid) && (execute_pressed)
	{
		speed_x = -10;
		speed_y = -jump_height;
	}
	else if place_meeting(x-1,y,obj_solid) && (execute_pressed)
	{
		speed_x = 10;
		speed_y = -jump_height;
	}
}

#endregion

/////////////////////////////////////////////////////

#region Fastfalling

/*
if down_pressed
{
	if !place_meeting(x,y+2,obj_solid)
	{
		if speed_y >= 0
		{
			if speed_y <= 15
			{
				speed_y += 5;
			}
			maxfall = 20;	
		}
	}
}
*/

#endregion

/////////////////////////////////////////////////////

#region Attacking

if spd_wanted > 0
{
	facing = "right";
}
else if spd_wanted < 0
{
	facing = "left";	
}

if light_attack
{
	attack_light_timer++;
}

if (attack_light_timer < attack_light_length) && (attack_light_timer > 0)
{
	attack_light_timer++;	
	if facing = "left"
	{
		with(instance_create_layer(x-16,y,0,obj_hit_zone))
		{
			image_xscale = 2;
			image_yscale = 4;
		}
	}
	else if facing = "right"
	{
		with(instance_create_layer(x+16,y,0,obj_hit_zone))
		{
			image_xscale = 2;
			image_yscale = 4;
		}
	}
}
else
{
	attack_light_timer = 0;
}

#endregion

/////////////////////////////////////////////////////