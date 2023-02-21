/// @description Insert description here
// You can write your code in this editor
window_set_fullscreen(true);


//Instancía objetos dependentes do player
instance_create_layer(x,y,"hidenLayer",objBotColisionLine);
instance_create_layer(x,y,"hidenLayer",objRightSideColisionLine);
instance_create_layer(x,y,"hidenLayer",objLeftSideColisionLine);
instance_create_layer(x,y,"hidenLayer",objTopColisionLine);
instance_create_layer(x,y,"visibleLayer",objDebbuger);

//Declara variáveis do player
horizontalSpeed = 0;
maxHorizontalSpeed = 2;
verticalSpeed = 0;
maxVerticalSpeed = 5;
accelerationPerFrame = 0.05; 
frictionPerFrame = 0.1;
xOrientation = 1;
yOrientation = -1;
jumpForce = 0.1;
coioteTime = 0;
state = "idle";
animations = {
	idle : spr_player_idle,
	walking: spr_player_walking,
	running: spr_player_running,
	jumping: spr_player_jumping,
	falling: spr_player_falling,
	landing: spr_player_landing,
}


//Counters
walkCounterTimer = 0;
walkCounter = 0;


function walkCounterFunc(){
	walkCounterTimer++;
	if(walkCounterTimer > 30){
		walkCounterTimer = 0;
		walkCounter = 0;
	}
	if(walkCounter == 0 && (global.button_left_released || global.button_right_released)){
		walkCounter = 1;
	}
	else if(walkCounter == 1 && (global.button_left_released || global.button_right_released)){
		walkCounter = 2;
	}

}