// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// copied from dialogue script and edited
function scr_system_text() constructor{
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
	
	// when a dialogue pops up, its immediately moved to the end of the array
	firstToLast = function(){
		// making first element in dialogue array into a temporary variable
		var _t = array_get(dialogues, 0);
		// deleting element we got from array
		array_delete(dialogues, 0, 1) // the one refers to number of values to delete
		// adding element we got to end of array
		array_insert(dialogues, array_length(dialogues), _t);
		// returning element
		return _t;
	}
	
	// moves the array at the end back to the front, and then returns the dialogue then at the end
	lastToFirst = function(){
		// making last element in dialogue array into a temporary variable
		var _s = array_get(dialogues, (array_length(dialogues)-1));
		// deleting element we got from array
		array_delete(dialogues, (array_length(dialogues)-1), 1) // the one refers to number of values to delete
		// adding element we got to start of array
		array_insert(dialogues, 0, _s);
		// returning element now at the end
		var _r = array_get(dialogues, (array_length(dialogues)-1));
		return _r;
	}
	
	count = function(){
		// returns the current length of the dialogues array
		return array_length(dialogues);
	}
}
