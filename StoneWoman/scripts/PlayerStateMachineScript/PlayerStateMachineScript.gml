// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function playerStateCheck(){
	switch(objPlayer.state){
		case "idle" : whenIdle(); break;
		case "walking" : whenWalking(); break;
		case "running" : whenRunning(); break;
		case "jumping" : whenJumping(); break;
		case "falling" : whenFalling(); break;
		case "landing" : whenLanding(); break;
	}
}

function setPlayerIdle(){
	objPlayer.sprite_index = objPlayer.animations.idle;
	objPlayer.image_index = 0;
	objPlayer.state = "idle";
}

function setPlayerWalking(){
	objPlayer.sprite_index = objPlayer.animations.walking;
	objPlayer.image_index = 0;
	objPlayer.state = "walking";
}

function setPlayerRunning(){
	objPlayer.sprite_index = objPlayer.animations.running;
	objPlayer.image_index = 0;
	objPlayer.state = "running";
}

function setPlayerJumping(){
	objPlayer.sprite_index = objPlayer.animations.jumping;
	objPlayer.image_index = 0;
	objPlayer.state = "jumping";
}

function setPlayerFalling(){
	objPlayer.sprite_index = objPlayer.animations.falling;
	objPlayer.image_index = 0;
	objPlayer.state = "falling";
}

function setPlayerLanding(){
	objPlayer.sprite_index = objPlayer.animations.landing;
	objPlayer.image_index = 0;
	objPlayer.state = "landing";
}



function whenIdle(){
	objPlayer.horizontalSpeed = 0;
	objPlayer.verticalSpeed = 0;
	if(global.button_left_pressed || global.button_right_pressed){
		setPlayerWalking();
	}
	if(global.button_A_pressed){
		objPlayer.verticalSpeed = 2;
		setPlayerJumping();
	}
}

function whenWalking(){
	walkCounterFunc();
	if(objPlayer.walkCounter == 2){
		objPlayer.horizontalSpeed = 0;
		setPlayerRunning();
	}
	if(global.button_left_released || global.button_right_released){
		objPlayer.horizontalSpeed = 0;
		setPlayerWalking();
	}
	else if(global.button_left && !global.button_right){
		objPlayer.xOrientation = -1;
		movePlayer();
	}
	else if(global.button_right && !global.button_left){
		objPlayer.xOrientation = 1;
		movePlayer();
	}
	else if(global.button_left && global.button_right){
		setPlayerIdle();
	}
	else if(!global.button_left && !global.button_right){
		setPlayerIdle();
	}
}

function whenRunning(){
	objPlayer.walkCounter = 0;
	objPlayer.walkCounterTimer = 0;
	if(global.button_left_released || global.button_right_released){
		objPlayer.horizontalSpeed = 0;
		setPlayerWalking();
	}
	else if(global.button_left && !global.button_right){
		objPlayer.xOrientation = -1;
		movePlayer();
	}
	else if(global.button_right && !global.button_left){
		objPlayer.xOrientation = 1;
		movePlayer();
	}
	else if(global.button_left && global.button_right){
		setPlayerIdle();
	}
	else if(!global.button_left && !global.button_right){
		setPlayerIdle();
	}
}

function whenJumping(){
	objPlayer.yOrientation = -1;
	jumpPlayer();
	if(global.button_A_released){
		objPlayer.verticalSpeed = 0;
		setPlayerFalling();
	}
	else if(objPlayer.image_index == sprite_get_number(objPlayer.sprite_index) - 1) {
		objPlayer.verticalSpeed = 0;
		setPlayerFalling();
	}
}

function whenFalling(){
	objPlayer.yOrientation = 1;
	fallPlayer();
}

function whenLanding(){
	objPlayer.horizontalSpeed = 0;
	objPlayer.verticalSpeed = 0;
	if(objPlayer.image_index == sprite_get_number(objPlayer.sprite_index) - 1) {
		setPlayerIdle();
	}
}