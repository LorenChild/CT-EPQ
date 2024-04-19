/// @description Insert description here
// You can write your code in this editor

// Creates new struct using system text script and assigns it to variable
dialogue = new scr_system_text();
// key used to move to next dialogue NOT NEEDED, decides where next based on global variable
// whether we're showing dialogue yet or not
showingDialogue = false;
// current dialogue to draw
currentDialogue = [];
// alpha variable, starts transparent to fade in (for draw event)
alpha = 0;

// variable of what global.menuText was last step
// starts very negative so its always lower than global.menuText variable at start so first text in array is used (see how step event works)
lastMenuText = -1000;
