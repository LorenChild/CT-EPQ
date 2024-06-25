/// @description Insert description here
// You can write your code in this editor

// creates yes object if yes pressed and no object if no pressed
if oldYesOrNo = 1{
	// if yes pressed
	instance_create_layer(x, y, "dialogue_layer", obj_open_world_dialogue_egg_yes);
	// adding egg to inventory
	global.inventory.item_add("Egg", 1, "It's shell is hard and shiny. A good specimen.");
	// destroying egg and barrier - destroys barrier touching egg
	with obj_open_world_egg{
		// instance_place to get unique id of object being collided with
		var _inst = instance_place(x, y, obj_open_world_barrier);
		if (_inst != noone){
			// destroying barrier instance touching egg
		    instance_destroy(_inst);
		}
		// destroying egg (its self)
		instance_destroy(self);
	}
	// making it so egg object not created again (destroys itsself and barrier on create)
	global.eggExists = false;
} else {
	// if no pressed, doing nothing except allowing you to move again
	with obj_open_world_player{
		canMove = true;
	}
}