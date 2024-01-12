// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory() constructor{
	// another constructor script
	//array to hold items
	inventory_items = [];
	// function to add new item to inventory - no sprite perameter because unlike tutorial my inventory will be text based - instead description
	item_set = function(_name, _quantity, _description){
		// pushes struct to inventory array
		array_push(inventory_items, {
		name: _name,
		quantity: _quantity,
		description: _description
		});
	}
	// function to find item already in array
	item_find = function(_name){
		// for loop - iterates through all values between 0 and length of inventory array
		// i++ means it increments by 1 after running the code (aka starts wth 0)
		for (var i=0; i<array_length(inventory_items); i++){
			// if name of item in array being iterated though is same as one being searched for...
			if (_name == inventory_items[i].name){
				// returns the point in the list where the found item is
				return i;
			}
		}
		// if array iterated through and item not found:
		return -1;
	}
	// function to add more of an existing item or to set a new item depending on if it exists in inventory or not
	item_add = function(_name, _quantity, _description){
		// uses find function to see if item is already in inventory
		// if yes, gives value of place in array, if no gives -1
		// temporary variable
		var _index = item_find(_name);
		// if item exists
		if (_index>=0){
			// adds number of items needing to be added to the current quantity
			inventory_items[_index].quantity += _quantity;
		} else{
			// if it doesn't already exist, sets new item
			item_set(_name, _quantity, _description);
		}
	}
	// to string function, to help debug struct
	to_string = function(){
		// returns array as a string
		return json_stringify(inventory_items);
	}
}