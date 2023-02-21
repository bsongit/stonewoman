/// @description Insert description here
// You can write your code in this editor

if(objPlayer.state == "falling"){
	while(place_meeting(objSolidGround.x, objSolidGround.y - 5, objBotColisionLine)){
		objPlayer.y -= 0.1; 
		objBotColisionLine.y -= 0.1; 
	}
	setPlayerLanding();
}




