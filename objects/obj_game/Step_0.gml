/// @description 
scr_controls();

#region Enable debug mode
if keyboard_check_pressed(vk_f1)
{
	if global.debug = true
	{
		global.debug = false;	
	}
	else
	{
		global.debug = true;
	}
}
#endregion

#region Enable frame-perfect mode

global.total_frames++;

if keyboard_check_pressed(vk_f2)
{
	if room_speed >= 60
	{
		global.frame_perfect_mode = true;
	}
	else
	{
		global.frame_perfect_mode = false;
	}
}

if global.frame_perfect_mode = true
{
	room_speed = 1;
}

if global.frame_perfect_mode = false
{
	room_speed = 60;	
}

#endregion
