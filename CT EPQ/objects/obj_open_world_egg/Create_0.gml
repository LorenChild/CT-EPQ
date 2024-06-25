/// @description Insert description here
// You can write your code in this editor

if global.eggExists = false{
	// instance_place to get unique id of object being collided with
	var _inst = instance_place(x, y, obj_open_world_barrier);
	if (_inst != noone){
		// destroying barrier instance touching egg
	    instance_destroy(_inst);
	}
	// destroying egg (its self)
	instance_destroy(self);
}