/// @description Insert description here
// You can write your code in this editor

// different because yes-no option

// if dialogue not already showing
if (showingDialogue == false) {
	// count function (from script) gets array length - checks if no more dialogues left in array (no more left to show)
	if (dialogue.count() <= 0){
		// destroys instance + early return (no later code is run)
		instance_destroy();
		return;
	}
	// if dialogue array longer than 0
	// pop function removes first value from dialogue array and returns it
	currentDialogue = dialogue.pop();
	// switching boolean to true
	showingDialogue = true;
} else{
	// if dialogue (question) is already showing - code controlling which option is selected
	// if no option is currently selected
	if (yesOrNo = 0){
		// if left pressed goes to yes, if right then no
		if (keyboard_check_released(keyLeft)){
			yesOrNo = 1;
		}
		if (keyboard_check_released(keyRight)){
			yesOrNo = 2;
		}
	}
	
	// if yes is currently selected
	if (yesOrNo = 1){
		// if left pressed nothing happens, if right then no
		if (keyboard_check_released(keyRight)){
			yesOrNo = 2;
		}
		// if option is selected
		if (keyboard_check_released(keySelect)){
		showingDialogue = false;
		alpha = 0;
		// WOULD NEED TO ADD SOMETHING HERE TO TELL MAIN CODE OBJECT WHAT ANSWER WAS - use 'with' probably
		// !!
		// then resetting it to 0
		yesOrNo = 0;
		}
	}
	
	// if no is currently selected
	if (yesOrNo = 2){
		// if left pressed goes to yes, if right then nothing happens
		if (keyboard_check_released(keyLeft)){
			yesOrNo = 1;
		}
		// if option is selected
		if (keyboard_check_released(keySelect)){
		showingDialogue = false;
		alpha = 0;
		// WOULD NEED TO ADD SOMETHING HERE TO TELL MAIN CODE OBJECT WHAT ANSWER WAS - use 'with' probably
		// !!
		// then resetting it to 0
		yesOrNo = 0;
		}
	}
}