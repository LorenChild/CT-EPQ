/// @description Insert description here
// You can write your code in this editor

//create new inventory struct
inventory = new scr_inventory();

// adding items to inventory - name, quantity, description
inventory.item_add("Wood", 3, "Looks chewy.");
inventory.item_add("Wood", 20, "Looks chewy.");
inventory.item_add("Human Leg", 5, "Please stop playing with knives.");

// uses to_string function, otherwise it would also show all the functions contained within the struct 'inventory' in the message
show_debug_message(inventory.to_string());

inventory.item_subtract("Wood", 23);
inventory.item_subtract("Human Leg", 2);

show_debug_message(inventory.to_string());