/// @description draw_text_outlined(x, y, string, colour, outline_colour)
/// @param x
/// @param  y
/// @param  string
/// @param  colour
/// @param  outline_colour
var xx = argument0;
var yy = argument1;
var str = argument2;
draw_set_colour(argument4);
draw_text(xx-2, yy, string_hash_to_newline(str));
draw_text(xx+2, yy, string_hash_to_newline(str));
draw_text(xx, yy-2, string_hash_to_newline(str));
draw_text(xx, yy+2, string_hash_to_newline(str));
draw_set_colour(argument3);
draw_text(xx, yy, string_hash_to_newline(str));
draw_set_colour(c_white);
