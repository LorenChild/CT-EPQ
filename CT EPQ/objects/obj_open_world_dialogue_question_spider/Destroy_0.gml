/// @description Insert description here
// You can write your code in this editor

// creates yes object if yes pressed and no object if no pressed
if oldYesOrNo = 1{
	// if yes pressed
	instance_create_layer(x, y, "dialogue_layer", obj_open_world_dialogue_spider_yes);
} else{
	// if no pressed
	instance_create_layer(x, y, "dialogue_layer", obj_open_world_dialogue_spider_no);
}
