/// @description Insert description here
// You can write your code in this editor

// setting inputs back to normal with player so you can move again
with obj_open_world_player{
	canMove = true;
}

// if yes pressed, takes you to battle room
if oldYesOrNo = 1{
	// updating start position and direction of player for when you go back into the room
	with obj_open_world_player{
		global.playerCoords[0] = x;
		global.playerCoords[1] = y;
		global.playerDirection = direction;
	}
	room_goto(rm_battle_example);
}