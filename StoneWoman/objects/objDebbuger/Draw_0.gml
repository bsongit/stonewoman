/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_ptbr);
draw_set_color(c_orange);
draw_set_halign(fa_left);
draw_text_transformed(100,100,sprite_get_number(objPlayer.sprite_index) ,1,1,0);