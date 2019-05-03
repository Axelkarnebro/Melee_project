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
	running = false;
	runOk = true;	
}

if haxis > -0.4 && haxis < 0.4
{
	spd_wanted = 0;
	running = false;
	runOk = true;
}

#endregion

#region Set 'jump' to 'true' if you press the 'jump-button'
if (jump) && !place_meeting(x,y-2,obj_solid)
{
	if !place_meeting(x,y+2,obj_solid)
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

#region Hit by player / knockback + damage

if place_meeting(x,y,obj_hit_zone)
{
	//DO ALL THE COLLISION STUFF
	var hit_zone_x = other.x;
	var hit_zone_y = other.y;
	
	
	
}

#endregion