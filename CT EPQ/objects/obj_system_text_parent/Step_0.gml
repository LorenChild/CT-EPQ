/// @description Insert description here
// You can write your code in this editor

// text will keep circling around and around, back and forth as global.menuText increases and decreases

// checks if global.menuText has increased or decreased
var _menuTextChange = global.menuText - lastMenuText;
// if next text is needed
if (_menuTextChange > 0){
	alpha = 0;
	// returns current first dialogue and puts it to end of array
	currentDialogue = dialogue.firstToLast();
	// setting dialogue to true (it's only false right at the start, so it doesn't try drawing before current dialogue variable is set)
	showingDialogue = true;
}

//if last text needed
if (_menuTextChange < 0){
	alpha = 0;
	// takes last dialogue back from end of array then returns the dialogue before that (which is then at the end of the array)
	currentDialogue = dialogue.lastToFirst();
	// setting dialogue to true (it's only false right at the start, so it doesn't try drawing before current dialogue variable is set)
	showingDialogue = true;
}

// if stays same, will = 0.

// updating variable for menu text last step
lastMenuText = global.menuText;