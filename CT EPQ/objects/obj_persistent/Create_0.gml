/// @description Insert description here
// You can write your code in this editor

// changing to and from fullscreen
fullscreen = true;

// variable for which battle state we're in - IS THIS VARIABLE ACTUALLY USED?
global.battleState = 0;
// varibale for which bit of menu system text we're in in a battle
global.menuText = 0;


// INFO ON CHARACTERS and enemies - later, get it to load info from save file
// order: 0 name, 1 max HP, 2 current HP, 3 base attack, 4 base defence, 
// 5 base charisma, 6 item equipped, 7 character face sprite
// base means stat value before things from items and effects are added
// atk range 0-100, def range 0-100, charisma range 0-100, HP range whatever feels right
// if item equipped = 0, no item equipped
global.characterInfoFootball = ["Football", 50, 50, 20, 10, 20, 0, spr_chara_example_1] // character sprite temporary!
global.characterInfoTemp1 = ["Guy1", 30, 30, 30, 30, 30, 0, spr_chara_example_2]
global.characterInfoTemp2 = ["Guy2", 30, 30, 30, 30, 30, 0, spr_chara_not_alexia]
global.enemyInfoExample = ["Ex-ample", 200, 100, 10, 20, 30, 0, spr_chara_example]

// FIGHT MENU DATA
// variable for the first popup menu that appears
global.firstMenu = ["Attack", "Act", "Item", "Flee"];
// another data set on charcter menu options because I don't want other list to get too hard to read
// order: 0 name of main character info list, 1 act options, 2 support options
global.characterOptionInfoFootball = [global.characterInfoFootball, ["Do a little dance", "Bounce"], ["Cheer", "Build pressure"]];
global.characterOptionInfoTemp1 = [global.characterInfoTemp1, ["Cry", "Scream"], ["Whimper", "Yelp"]];
global.characterOptionInfoTemp2 = [global.characterInfoTemp2, ["Have existential thoughts outloud", "Stare blankly"], ["Nihilist encouragement", "Think hard"]];

// Haven't put the below code into OneNote because it's not useful yet or correct
// INFO ON ITEMS - to do - use inventory script!
// list of usable items in inventory
//global.itemList = ["Lemon jam", "Long peas", "small stone"];
// list of equippable artifacts in inventory
//global.artifactList = ["Yoyo", "Cardboard box", "Lacrosse stick", "Flower clip"];
// list of permanent / plot items in inventory
