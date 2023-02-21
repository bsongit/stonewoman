// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movePlayer(){
		objPlayer.horizontalSpeed += objPlayer.accelerationPerFrame;
		if(objPlayer.state == "walking" && objPlayer.horizontalSpeed  >objPlayer.maxHorizontalSpeed/2){
			objPlayer.horizontalSpeed = objPlayer.maxHorizontalSpeed/2;
		}
		else if(objPlayer.state == "running" && objPlayer.horizontalSpeed > objPlayer.maxHorizontalSpeed){
			objPlayer.horizontalSpeed = objPlayer.maxHorizontalSpeed;
		}
		objPlayer.x += objPlayer.horizontalSpeed * objPlayer.xOrientation;
}

function jumpPlayer(){
		objPlayer.verticalSpeed += objPlayer.jumpForce;
		if(objPlayer.verticalSpeed > objPlayer.maxVerticalSpeed){
			objPlayer.verticalSpeed = objPlayer.maxVerticalSpeed;
		}
		objPlayer.y += objPlayer.verticalSpeed * objPlayer.yOrientation;
}

function fallPlayer(){
		objPlayer.verticalSpeed += objPlayer.accelerationPerFrame * 3;
		if(objPlayer.verticalSpeed > objPlayer.maxVerticalSpeed){
			objPlayer.verticalSpeed = objPlayer.maxVerticalSpeed;
		}
		objPlayer.y += objPlayer.verticalSpeed * objPlayer.yOrientation;
}