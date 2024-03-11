/// @description Insert description here
// You can write your code in this editor

// if dialogue not already showing
if (showingDialogue == false) {
	// count function (from script) gets array length - checks if no more dialogues left in array (no more left to show)
	if (dialogue.count() <= 0){
		// destroys instance + early return
		instance_destroy();
		return;
	}
	// if dialogue array longer than 0
	// pop function removes first value from dialogue array and returns it
	currentDialogue = dialogue.pop();
	// switching boolean to true
	showingDialogue = true;
} else{
	// if dialogue is already showing
	// if any key pressed resets dialogue to nothing showing
	if (keyboard_check_pressed(keyNext)){
		showingDialogue = false;
		alpha = 0;
	}
}