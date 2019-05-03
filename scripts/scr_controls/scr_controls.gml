///scr_controls
//This is the main control script. First, call the script then use the terms used below to call for inputs! =)

/////////////////// MOUSE CLICK //////////////////////////
left_click_hold = device_mouse_check_button(0,mb_left);
right_click_hold = device_mouse_check_button(0,mb_right);
middle_click_hold = device_mouse_check_button(0,mb_middle);

left_click_pressed = device_mouse_check_button_pressed(0,mb_left);
right_click_pressed = device_mouse_check_button_pressed(0,mb_right);
middle_click_pressed = device_mouse_check_button_pressed(0,mb_middle);

left_click_released = device_mouse_check_button_released(0,mb_left);
right_click_released = device_mouse_check_button_released(0,mb_right);
middle_click_released = device_mouse_check_button_released(0,mb_middle);

///////////////////// DIRECTION PRESS /////////////////////////////
up_hold = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_axis_value(0, gp_axislv) < -0.4;
down_hold = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_axis_value(0, gp_axislv) >  0.4;
right_hold = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_axis_value(0, gp_axislh) >  0.4;
left_hold = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_axis_value(0, gp_axislh) < -0.4;

up_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_axis_value(0, gp_axislv) < -0.4;
down_pressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_axis_value(0, gp_axislv) >  0.4;
right_pressed = keyboard_check_pressed(vk_right) || device_mouse_check_button_pressed(0,mb_left) || keyboard_check_pressed(ord("D")) || gamepad_axis_value(0, gp_axislh) >  0.4;
left_pressed = keyboard_check_pressed(vk_left) || device_mouse_check_button_pressed(0,mb_left) || keyboard_check_pressed(ord("A")) || gamepad_axis_value(0, gp_axislh) < -0.4;

up_released = keyboard_check_released(vk_up);
down_released = keyboard_check_released(vk_down);
right_released = keyboard_check_released(vk_right);
left_released = keyboard_check_released(vk_left);

///////////////////////// MAIN ///////////////////////////////
execute_pressed  = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face4);
execute_hold  = keyboard_check(vk_space) || gamepad_button_check(0, gp_face4);
execute_released  = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face4);

attack_pressed = keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_face1);
attack_hold = keyboard_check(ord("E")) || gamepad_button_check(0, gp_face1);
attack_released = keyboard_check_released(ord("E")) || gamepad_button_check_released(0, gp_face1);

shift_pressed  = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_shoulderlb);
shift_hold  = keyboard_check(vk_shift) || gamepad_button_check(0, gp_shoulderlb);
shift_released  = keyboard_check_released(vk_shift) || gamepad_button_check_released(0, gp_shoulderlb);

///////////////////////// OTHER ///////////////////////////////
ctrl_hold = keyboard_check(vk_control);
ctrl_pressed = keyboard_check_pressed(vk_control);
ctrl_released = keyboard_check_released(vk_control);

start_pressed = keyboard_check_pressed(vk_enter) || gamepad_button_check(0, gp_start);
select_pressed = keyboard_check_pressed(vk_f11) || gamepad_button_check_pressed(0, gp_select);




