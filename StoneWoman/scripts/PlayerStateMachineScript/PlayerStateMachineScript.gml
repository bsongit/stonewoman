// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function playerStateCheck(){
	switch(objPlayer.state){
		case "idle" : whenIdle(); break;
		case "running" : whenRunning(); break;
	}
}

function setPlayerIdle(){
	objPlayer.sprite_index = objPlayer.animations.idle;
	objPlayer.image_index = 0;
	objPlayer.state = "idle";
}

function setPlayerRunning(){
	objPlayer.sprite_index = objPlayer.animations.running;
	objPlayer.image_index = 0;
	objPlayer.state = "running";
}

function whenIdle(){
	objPlayer.horizontalSpeed = 0;
	if(global.button_left_pressed || global.button_right_pressed){
		setPlayerRunning();
	}
}

function whenRunning(){
	if(!global.button_left && !global.button_right){
		setPlayerIdle();
	}
	else if(global.button_left && global.button_right){
		setPlayerIdle();
	}
	else if(global.button_left && !global.button_right){
		objPlayer.xOrientation = -1;
		movePlayer();
	}
	else if(global.button_right && !global.button_left){
		objPlayer.xOrientation = 1;
		movePlayer();
	}
}