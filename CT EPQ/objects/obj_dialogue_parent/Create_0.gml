/// @description Insert description here
// You can write your code in this editor

// Creates new struct using dialogue script and assigns it to variable
dialogue = new scr_dialogue();
// assigning key used to move to next dialogue
keyNext = vk_space;
// whether we're showing dialogue yet or not
showingDialogue = false;
// current dialogue to draw
currentDialogue = [];
// alpha variable, starts transparent to fade in (for draw event)
alpha = 0;

