event_inherited();
if area == noone {
    area = instance_create_layer(x,y,"Instances",obj_interact);
    //area.image_xscale *= x_invert_area ? -1 : 1;
    //area.image_yscale *= y_invert_area ? -1 : 1;
   // area.prompt = prompt;
}

if area.inside == true {
    //action = false;
    //inside = false;
    if keyboard_check_pressed(ord("F")) and my_dialog == noone {
        if(instance_exists(obj_tb_switcher)) exit;

	var _switcher = instance_create_depth(0,0,0,obj_tb_switcher);
	_switcher.player =self;
	_switcher.enemy = other;
	_switcher.original_room = room;

	room_goto(rm_turnbased_battle);
        area = noone;
        
        /*area.prompt = prompt;
        my_dialog.name = my_name;
        my_dialog.creator = self;
        my_dialog.text = my_text;*/
    }
}

depth = -bbox_bottom;