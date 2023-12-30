// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dialogue() constructor{
	// array to hold current dialogue, will be filled with structs
	dialogues = [];
	// add function, perameters sprite and message that we pass through
	add = function(spr, msg){
		array_push(dialogues, {
		//structure with variables
		sprite: spr,
		message: msg
		})
	}
		
	pop = function(){
		// making first element in dialogue array into a temporary variable
		var _t = array_get(dialogues, 0);
		// deleting element we got from array
		array_delete(dialogues, 0, 1) // the one refers to number of values to delete
		// returning element
		return _t;
	}
	
	count = function(){
		// returns the current length of the dialogues array
		return array_length(dialogues);
	}
}