/// @description Insert description here
// You can write your code in this editor

// changing to and from fullscreen
fullscreen = true;

// variable for which battle state we're in - IS THIS VARIABLE ACTUALLY USED? NO! hooray.
global.battleState = 0;
// varibale for which bit of menu system text we're in in a battle
global.menuText = 0;

// 21/06/24 variable deciding whether / which after battle dialogue should play
global.afterBattleDialogue = 0;
// 21/06/24 variable storing coords of open world player object, loaded on create of object and updated on destroy
global.playerCoords = [500, 500];
// 21/06/24 same for player direction
global.playerDirection = 1;


// INFO ON CHARACTERS and enemies - later, get it to load info from save file
// order: 0 name, 1 max HP, 2 current HP, 3 base attack, 4 base defence, 
// 5 base charisma, 6 item equipped, 7 character face sprite, 8 main options, 9 support options
// base means stat value before things from items and effects are added
// atk range 0-100, def range 0-100, charisma range 0-100, HP range whatever feels right
// if item equipped = 0, no item equipped
global.characterInfoFootball = ["Football", 40, 40, 20, 10, 20, 0, spr_chara_example_1, ["Do a little dance", "Bounce"], ["Cheer", "Build pressure"]] // character sprite temporary!
global.characterInfoTemp1 = ["Cri Guy", 50, 50, 30, 10, 30, 0, spr_chara_example_2, ["Cry", "Scream"], ["Whimper", "Yelp"]]
global.characterInfoTemp2 = ["Sockratiis", 30, 30, 30, 10, 30, 0, spr_chara_not_alexia, ["Existential thoughts", "Stare blankly"], ["Nihilist encouragement", "Think hard"]]

global.enemyInfoExample = ["Ex-ample", 200, 200, 10, 20, 30, 0, spr_chara_example]

// FIGHT MENU DATA
// variable for the first popup menu that appears
global.firstMenu = ["Act", "Flee"]; //attack option gotten rid of 12/06/24, item option gotten rid of 26/06/24
global.firstMenuSupport = ["Support", "Item"];

// 15/06/24 damage variables (to be properly assigned and changed in battle code object, including w use of scripts
global.damage = 0;
global.enemyDamage = 0;


// Haven't put the below code into OneNote because it's not useful yet or correct
// INFO ON ITEMS - to do - use inventory script!
// list of usable items in inventory
//global.itemList = ["Lemon jam", "Long peas", "small stone"];
// list of equippable artifacts in inventory
//global.artifactList = ["Yoyo", "Cardboard box", "Lacrosse stick", "Flower clip"];
// list of permanent / plot items in inventory

// 23/06/24 - variable for sending to menu
escapePoints = 0;

// 24/06/24 inventory!
//create new inventory struct
global.inventory = new scr_inventory();
// adding items to inventory - name, quantity, description
global.inventory.item_add("Wood", 1, "Looks chewy. +15 HP", 15);
global.inventory.item_add("cough droops TM", 1, "Some kind of branded sweet. +9 HP", 9);
global.inventory.item_add("Frog", 1, "Frog. +2 HP", 2);

// 25/06/24 - wether egg object should exist or its already been picked up
global.eggExists = true;

