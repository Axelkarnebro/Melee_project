#region Move towards the "follow" object

if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x)/6; // "6" = the camera movement speed
y += (yTo - y)/6;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera, vm);

#endregion
