/// @description Insert description here
// You can write your code in this editor

// bounces off wall/ other balls if it collides
//if (place_meeting(x+1, y+1, obj_football_collision)) or (place_meeting(x-1, y-1, obj_football_collision)) or (place_meeting(x+1, y+1, obj_football_ball)) or (place_meeting(x-1, y-1, obj_football_ball)){
//	direction = 360-direction;
//}

// bouncing off top or bottom
//if (place_meeting(x, y+speed, obj_football_collision)) or (place_meeting(x, y-speed, obj_football_collision)) or (place_meeting(x, y+speed, obj_football_ball)) or (place_meeting(x, y-speed, obj_football_ball)){
//	direction = 360 - direction;
//} else if (place_meeting(x+speed,y, obj_football_collision)) or (place_meeting(x-speed, y, obj_football_collision)) or (place_meeting(x+speed, y, obj_football_ball)) or (place_meeting(x-speed, y, obj_football_ball)){
//	direction = 180 -direction;
//}


// bouncing off top or bottom
if (place_meeting(x, y+vSpd, obj_football_collision)) or (place_meeting(x, y+vSpd, obj_football_ball)) or (place_meeting(x, y+vSpd, obj_football_player)) {
	tempVspd = vSpd;
	while (abs(vSpd) > 0.1){
		vSpd *= 0.5;
		if (place_meeting(x, y+vSpd, obj_football_collision)) or (place_meeting(x, y+vSpd, obj_football_ball)) or (place_meeting(x, y+vSpd, obj_football_player)){
			y += vSpd;
		}
	}
	vSpd = -tempVspd;
}

// bouncing off left or right
// bouncing off top or bottom
//note: remember vSpd has already been inverted, so trying to check where it used to be vertically
if (place_meeting(x+hSpd, y+vSpd, obj_football_collision)) or (place_meeting(x+hSpd, y+vSpd, obj_football_ball)) or (place_meeting(x+hSpd, y+vSpd, obj_football_player)){
	tempHspd = hSpd;
	while (abs(hSpd) > 0.1){
		hSpd *= 0.5;
		if (place_meeting(x+hSpd, y+vSpd, obj_football_collision)) or (place_meeting(x+hSpd, y+vSpd, obj_football_ball))  or (place_meeting(x+hSpd, y+vSpd, obj_football_player)) {
			x += hSpd;
		}
	}
	hSpd = -tempHspd;
}

//actually moving
y += vSpd;
x += hSpd;

// GOAL
if (place_meeting(x, y, obj_football_goal)){
	global.football_scr += 1;
	instance_destroy(self);
}

// balls disappearing (getting lost)
if (place_meeting(x, y, obj_football_eater_of_balls)){
	instance_destroy(self);
}



