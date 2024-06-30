/// @description Insert description here
// You can write your code in this editor

// variable for if inventory should be drawn
inventoryOpen = 0;
// inventory option selected variable - starts from 0
inventoryOptionSelected = 0;
// variable for which character is selected to use the item on
inventoryCharacterSelected = 0; // starting from 0

// list of characters for inventory select
characterList = [global.characterInfoFootball, global.characterInfoTemp1, global.characterInfoTemp2];

// so pressing select to open character select menu doesn't also just immediately select the character
enterJustPressed = false;