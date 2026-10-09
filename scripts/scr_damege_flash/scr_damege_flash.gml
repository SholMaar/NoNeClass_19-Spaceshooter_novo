function activated_flash(){
	var _flash = instance_create_depth(0, 0, -1, obj_damege_flash);
	
	var _xscale = room_width / _flash.sprite_width;
	var _yscale = room_height / _flash.sprite_height;
	
	_flash.image_xscale = _xscale;
	_flash.image_yscale = _yscale;
}