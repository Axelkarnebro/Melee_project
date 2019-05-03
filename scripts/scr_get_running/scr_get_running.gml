//scr_get_running()

haxis = gamepad_axis_value(0, gp_axislh); //Sparar gamepad valuen i en enkel variabel
vaxis = gamepad_axis_value(0, gp_axislv); //Sparar gamepad valuen i en enkel variabel

if haxis < -0.4
{
	spd_wanted = -air_speed;
}
else if haxis > 0.4
{
	spd_wanted = air_speed;
}

if runOk
{
	if haxis < -0.4
	{
		if alarm[1] = -1
		{
			alarm[1] = 4;
		}
	
		if haxis < -0.9
		{
			running = true;
		}
	
	}
	else if haxis > 0.4
	{
		if alarm[1] = -1
		{
			alarm[1] = 4;
		}
	
		if haxis > 0.9
		{
			running = true;
		}
	}
}
	
	
