// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movePlayer(){
		objPlayer.horizontalSpeed += accelerationPerFrame;
		if(objPlayer.horizontalSpeed > maxHorizontalSpeed){
			objPlayer.horizontalSpeed = maxHorizontalSpeed;
		}
		objPlayer.x += objPlayer.horizontalSpeed * objPlayer.xOrientation;
}