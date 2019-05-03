draw_set_font(fnt_twoson);
draw_set_color(c_white);

var haxis = gamepad_axis_value(0, gp_axislh);

if global.debug = true
{
	draw_text_outline(20,20,"FPS: " + string(fps),c_white,c_black);
	draw_text_outline(20,40,"haxis: " + string(haxis),c_white,c_black);
	draw_text_outline(20,60,"HSP: " + string(spd_wanted),c_white,c_black);
	draw_text_outline(20,80,"Friction: " + string(fric),c_white,c_black);
	draw_text_outline(20,100,"Frames: " + string(global.total_frames),c_white,c_black);
	draw_text_outline(20,120,"Dash Count: " + string(dash_count),c_white,c_black);
	draw_text_outline(20,140,"Dash Timer: " + string(dash_timer),c_white,c_black);
	draw_text_outline(20,160,"Is grounded? = " + string(grounded),c_white,c_black);
	draw_text_outline(20,180,"Dash: " + string(dash),c_white,c_black);
	draw_text_outline(20,200,"Facing: " + facing,c_white,c_black);
}