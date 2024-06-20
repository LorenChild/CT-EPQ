/// @description Insert description here
// You can write your code in this editor

// using dialogue struct, just will be changing the way it is drawn, and adding a yes-no option where you have to select one to move on

// Creates new struct using dialogue script and assigns it to variable
dialogue = new scr_dialogue();
// assigning keys to switch between options and select answer
keyRight = vk_right;
keyLeft = vk_left;
keySelect = vk_enter;
// if yes or no is selected - yes = 1, no = 2, not yes selected = 0
yesOrNo = 0;
// whether we're showing dialogue yet or not
showingDialogue = false;
// current dialogue to draw
currentDialogue = [];
// alpha variable, starts transparent to fade in (for draw event)
alpha = 0;
// height of one line of text in current font - can check by debugging 'height' variable in obj_dialogue_parent draw event
fontHeight = 21;


//20/06/24 - old yes or no variable (from q before yesOrNo reset)
oldYesOrNo = 0;

