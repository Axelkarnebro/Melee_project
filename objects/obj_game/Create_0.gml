if !instance_exists(obj_camera)
{
	instance_create_depth(x,y,0,obj_camera);	
}

#region Global variables

global.debug = false;
global.frame_perfect_mode = false;
global.total_frames = 0;

#endregion