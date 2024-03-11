/// @description Insert description here
// You can write your code in this editor

//gives random real number in range (irandom for integer)

//speed = random_range(5, 10);
//direction = random_range(0, 360);

// getting random vertical and horizontal speeds (both left, right, up and down, within a range)
hSpd = random_range(3, 5);
randomH = random_range(0, 10);
// 50 50 chance for other direction
if (randomH > 5){
	hSpd = random_range(-3, -5)
}
vSpd = random_range(3, 5);
randomV = random_range(0, 10);
// 50 50 chance for other direction
if (randomV > 5){
	vSpd = random_range(-3, -5)
}

