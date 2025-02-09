var _cam = view_camera[0];
var _xbuf = 20, _ybuf = 20, _op_border = 5;

var _view_width = camera_get_view_width(_cam);
var _view_height = camera_get_view_height(_cam);

var _x1 = 0;
var _y1 = _view_height / 1.7;
var _x2 = _view_width;
var _y2 = _view_height;

var _w = 250;
var _h = 13;


#region dialog_box
draw_set_color(c_yellow);
draw_rectangle(_x1,_y1,_x2,_y2,false);

draw_set_color(c_black);
draw_rectangle(_x1+_op_border,_y1+_op_border,_x2-_op_border,_y2-_op_border,false);
#endregion

#region health_player
var _c = c_lime;
_x1 = _view_width - _xbuf*2 - _view_width/3;
_y1 = _ybuf*4.8;
_x2 = _x1 - _xbuf + _view_width/3;
_y2 = _y1;

draw_sprite_stretched(spr_hp,0,_x1,_y1,_w,_h);

//draw_line_width_color(_x1,_y1,_x2,_y2,10,_c,_c);



draw_sprite_stretched_ext(spr_hp,1,_x1,_y1,_w*(player.hp/player.hp_total),_h,_c,1);

/*_x1 = (_view_width - _xbuf*2 - _view_width/3 ) + 2;
_y1 = (_view_height /1.5 - _ybuf*2);
_x2 = (_x1 - _xbuf + _view_width/3) - 4;
_y2 = _y1;
*/
//draw_line_width_color(_x1,_y1,_x2,_y2,10,_c,_c)
#endregion

#region health_enemy
_c = c_red;
_x1 = _xbuf*2;
_y1 = _ybuf*4.8;
_x2 = _x1 - _xbuf + _view_width/3;
_y2 = _y1;

draw_sprite_stretched(spr_hp,0,_x1,_y1,_w,_h);
draw_sprite_stretched_ext(spr_hp,1,_x1,_y1,_w * (enemy.hp/enemy.total_hp),_h,_c,_c)
//draw_line_width_color(_x1,_y1,_x2,_y2,10,_c,_c);
#endregion