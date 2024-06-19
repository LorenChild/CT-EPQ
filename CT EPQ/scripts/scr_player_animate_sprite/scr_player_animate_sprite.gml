// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_animate_sprite(){
	var _cardinalDirection = round(direction/90); // turning direction into numbers 0 to 3
	// working on how many frames of a particular animation in the sprite (because each sprite has animations for 4 directions)
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	// setting frame to correct image index
	image_index = localFrame + (_cardinalDirection*_totalFrames);
	localFrame += sprite_get_speed(sprite_index)/FRAME_RATE; // image speed of sprite divided by frame rate (because this code runs each frame)

	// if animation would loop on next game step (wrapping around to start of animation)
	if (localFrame >= _totalFrames){
		animationEnd = true; //  should add to a create event if you actually needed to use this variable
		localFrame -= _totalFrames;
	} else animationEnd = false;
}