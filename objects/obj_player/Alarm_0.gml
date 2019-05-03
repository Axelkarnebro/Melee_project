/// @description Jumpsquat
// You can write your code in this editor
if execute_hold
{
	sprite_index = spr_player;
	jump = true;
}
else
{
	if wave_dash_timer <= 0
	{
		sh = true;
	}
	sprite_index = spr_player;
	jumpsquat = false;
}

