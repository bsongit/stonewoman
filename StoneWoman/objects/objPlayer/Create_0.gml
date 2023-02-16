/// @description Insert description here
// You can write your code in this editor
window_set_fullscreen(true);


//Instancía objetos dependentes do player
instance_create_layer(x,y,"hidenLayer",objBotColisionLine);
instance_create_layer(x,y,"hidenLayer",objRightSideColisionLine);
instance_create_layer(x,y,"hidenLayer",objLeftSideColisionLine);
instance_create_layer(x,y,"hidenLayer",objTopColisionLine);

//Declara variáveis do player
horizontalSpeed = 0;
maxHorizontalSpeed = 2;
verticalSpeed = 0;
maxVerticalSpeed = 5;
accelerationPerFrame = 0.05; 
frictionPerFrame = 0.1;
xOrientation = 1;
yOrientation = -1;
jumpLength = 0;
jumpForce = 0;
coioteTime = 0;
state = "idle";
animations = {
	idle : spr_player_idle,
	running: spr_player_running
}