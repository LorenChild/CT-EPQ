/// @description Insert description here
// You can write your code in this editor

// opening and closing inventory if shift pressed
if keyboard_check_pressed(vk_shift){
	// getting value of canMove variable from player object
	with obj_open_world_player{
		var _canMove = canMove;
	}
	// if canMove = true so can only open inventory if dialogue not open
	if (inventoryOpen = 0) and (_canMove = true){
		inventoryOpen = 1;
		with obj_open_world_player{
			canMove = false;
		}
	} else if (inventoryOpen = 1){
		inventoryOpen = 0;
		with obj_open_world_player{
			canMove = true;
		}
	} else if (inventoryOpen = 2){
		// going back from character select to item select
		inventoryOpen = 1;
	}
}
// changing inventory selected value
// getting inventory as array (so I can get its length)
var _inventory_item = global.inventory.item_get();

if (inventoryOptionSelected = -10) and (array_length(_inventory_item) > 0){ // so its set back to 0 if another item is picked up
	inventoryOptionSelected = 0;
}

if (inventoryOpen = 1) or (inventoryOpen = 2){ // so you can use up down arrow keys to change item selected even while characters are showing
		
	// so code only runs if player still has at least 1 item
	if (inventoryOptionSelected != -10){
		inventoryInputUp = keyboard_check_pressed(vk_up);
		inventoryInputDown = keyboard_check_pressed(vk_down);
		inventoryInput = inventoryInputDown - inventoryInputUp;
		if inventoryInput > 0{
			inventoryOptionSelected += 1;
		} else if inventoryInput < 0{
			inventoryOptionSelected -= 1;
		}
		// so it wraps round
		if inventoryOptionSelected = -1{
			inventoryOptionSelected = array_length(_inventory_item) - 1;
		} else if inventoryOptionSelected = array_length(_inventory_item){
			inventoryOptionSelected = 0;
		}
	}
}
if (inventoryOpen = 1) and (keyboard_check_pressed(vk_enter)){ // because otherwise would set enterJustPressed to be true every time you press enter when inventoryOpen = 2 as well
	
	// so code only runs if player still has at least 1 item
	if (inventoryOptionSelected != -10){
		inventoryOpen = 2;
		enterJustPressed = true; // so it can't immediately select in next stage
	}
}

if inventoryOpen = 2{
	// item selected state - picking which character to use the item on
	// draw in draw event
	// 3 selectable characters from characterList in create event
	inventoryInputLeft = keyboard_check_pressed(vk_left);
	inventoryInputRight = keyboard_check_pressed(vk_right);
	inventoryInput = inventoryInputRight - inventoryInputLeft;
	if inventoryInput > 0{
		inventoryCharacterSelected += 1;
	} else if inventoryInput < 0{
		inventoryCharacterSelected -= 1;
	}
	// so it wraps round
	if inventoryCharacterSelected = -1{
		inventoryCharacterSelected = (array_length(characterList) - 1);
	} else if inventoryCharacterSelected = array_length(characterList){
		inventoryCharacterSelected = 0;
	}
	// selecting a character
	if keyboard_check_pressed(vk_enter) and enterJustPressed = false{ // to make sure enter is different fromthe enter that made you enter character select menu
		// adding relevant HP to selected character (IF HP NOT ALREADY FULL)
		if (characterList[inventoryCharacterSelected][2] != characterList[inventoryCharacterSelected][1]){
			
			// so code only runs if player still has at least 1 item
			if (inventoryOptionSelected != -10){
				characterList[inventoryCharacterSelected][2] += _inventory_item[inventoryOptionSelected].hpChange;
				// so it doesn't go over max HP - if over, sets to max
				if (characterList[inventoryCharacterSelected][2] > characterList[inventoryCharacterSelected][1]){
					characterList[inventoryCharacterSelected][2] = characterList[inventoryCharacterSelected][1];
				}
				// removing item from inventory - arguments are name and quantity
				global.inventory.item_subtract(_inventory_item[inventoryOptionSelected].name, 1);
				// subtracting 1
				inventoryOptionSelected -=1;
				// if it now = -1, setting it to 0
				if (inventoryOptionSelected = -1) inventoryOptionSelected = 0;
			}
			
			// if no items left
			var _newInventoryItem = global.inventory.item_get(); //  getting current length of inventory
			if (array_length(_newInventoryItem) = 0){
				inventoryOptionSelected = -10; // if variabe = -10 draw code and option select code and adding HP code and select to go to character select code doesn't run
			}
		}
	}
	// resetting enter just pressed variable
	if (enterJustPressed = true) enterJustPressed = false;
}