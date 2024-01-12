/// @description Insert description here
// You can write your code in this editor

//create new inventory struct
inventory = new scr_inventory();

// adding items to inventory - name, quantity, description
inventory.item_add("Wood", 3, "Looks chewy.");
inventory.item_add("Wood", 20, "Looks chewy.");
inventory.item_add("Human Leg", 5, "Please stop playing with knives.");

show_debug_message(inventory);