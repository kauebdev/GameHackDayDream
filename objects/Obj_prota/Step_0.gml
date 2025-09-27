var mov_x = 0;
var mov_y = 0;
if (global.time){ 
if (keyboard_check_pressed(ord("W"))) last_dir = 1;
if (keyboard_check_pressed(ord("S"))) last_dir = 2;
if (keyboard_check_pressed(ord("A"))) last_dir = 3;
if (keyboard_check_pressed(ord("D"))) last_dir = 4;

switch (last_dir) {
    case 1: if (keyboard_check(ord("W"))) mov_y = -1; else last_dir = 0; break;
    case 2: if (keyboard_check(ord("S"))) mov_y =  1; else last_dir = 0; break;
    case 3: if (keyboard_check(ord("A"))) mov_x = -1; else last_dir = 0; break;
    case 4: if (keyboard_check(ord("D"))) mov_x =  1; else last_dir = 0; break;
}


if (mov_x != 0 || mov_y != 0){
    var can_move_x = !place_meeting(x + (mov_x * global.protaVel), y, obj_colision);
    var can_move_y = !place_meeting(x, y + (mov_y * global.protaVel), obj_colision);


    if (!can_move_x) mov_x = 0;
    if (!can_move_y) mov_y = 0;

    // se ainda houver movimento, normaliza
    if (mov_x != 0 || mov_y != 0) {
        var len = point_distance(0, 0, mov_x, mov_y);
        mov_x = (mov_x / len) * global.protaVel;
        mov_y = (mov_y / len) * global.protaVel;

        x += mov_x;
        y += mov_y;
		
		// Checa colisão com inimigo
		if (place_meeting(x, y, obj_inimigo) && can_take_damage) {

		    // Aplica dano
		    global.vida -= 2;
		    can_take_damage = false;
		    alarm[0] = damage_cooldown; // vai resetar o can_take_damage automaticamente

		    // Empurra para trás
		    x -= mov_x * 4; // empurra na direção oposta do movimento
		    y -= mov_y * 4;
		}
		
		moving = true;
		
		var _dx = mov_x;
		var _dy = mov_y;
		
		// Determina a direção principal do movimento
		if (abs(_dx) > abs(_dy)) {
			// Movimento horizontal
	        if (_dx > 0) {
	            sprite_index = spr_rightmove; // Andando para a direita
	        } else {
	            sprite_index = spr_leftmove; // Andando para a esquerda		
	        }
	    } else {
	        // Movimento vertical
	        if (_dy > 0) {
	            sprite_index = spr_downmove; // Andando para baixo
	        } else {
	            sprite_index = spr_upmove; // Andando para cima
	        }
	    } 
	}
}
else {
	moving = false;
	if (sprite_index == spr_leftmove) {
        sprite_index = spr_left;
    } else if (sprite_index == spr_rightmove) {
        sprite_index = spr_right;
    } else if (sprite_index == spr_upmove) {
        sprite_index = spr_up;
    } else if (sprite_index == spr_downmove) {
        sprite_index = spr_down;
    }
}

// Controle de ataque
if (keyboard_check(vk_space) && !attacking && attack_cooldown == 0) {
    attacking = true;
    attack_cooldown = 30; // Duração do ataque (ajuste conforme necessário)
    if (sprite_index == spr_up) {
        sprite_index = spr_upattack;
    } else if (sprite_index == spr_down) {
        sprite_index = spr_downattack;
    } else if (sprite_index == spr_left) {
        sprite_index = spr_leftattack;
    } else if (sprite_index == spr_right) {
        sprite_index = spr_rightattack;
    }
}

// Após o ataque, esperar o cooldown
if (attack_cooldown > 0) {
    attack_cooldown -= 1;
}

// Quando o ataque terminar, voltar ao estado anterior
if (attack_cooldown == 0 && attacking) {
    attacking = false;
    if (!moving) {
        if (sprite_index == spr_upattack) {
            sprite_index = spr_up;
        } else if (sprite_index == spr_downattack) {
            sprite_index = spr_down;
        } else if (sprite_index == spr_leftattack) {
            sprite_index = spr_left;
        } else if (sprite_index == spr_rightattack) {
            sprite_index = spr_right;
        }
    }
}
                   
if (!instance_exists(obj_inimigo)) {
    global.kills = 0;
    room_goto_next();
	}
}
