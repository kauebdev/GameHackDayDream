if (global.time){
// Movimento normal do inimigo (defina o movimento do seu inimigo aqui)
// Exemplo de movimentação básica:
if (distance_to_object(Obj_prota) < 200){
    // Movimento em direção ao jogador
    var tx = Obj_prota.x;
	var ty = Obj_prota.y;

	// se ainda não está alinhado no X
	if (x != tx) {
	    mp_linear_step(tx, y, vel, true); // anda só no eixo X
	}
	else if (y != ty) {
	    mp_linear_step(x, ty, vel, true); // só depois anda no eixo Y
	}

    // Calcula o deslocamento horizontal e vertical (calculat frame)
    var dx = Obj_prota.x - x;
    var dy = Obj_prota.y - y;

} else {
    // Caso o inimigo não esteja se movendo
    speed = 0;
}


if (distance_to_object(Obj_prota) > 200) { 
	// caso o inimigo esteja longe ele fica parado
	sprite_index =spr_inimigo
	
	move_timer -= 1;

	// se acabou o tempo, escolhe nova direção
	if (move_timer <= 0) {
	    dir = irandom(4);       // número aleatório entre 0 e 4
	    move_timer = irandom_range(30, 90); // tempo até trocar 
	}

	// aplica movimento de acordo com a direção
	var mov_x = 0;
	var mov_y = 0;

	switch (dir) {
	    case 1: mov_y = -1; break; // cima
	    case 2: mov_y =  1; break; // baixo
	    case 3: mov_x = -1; break; // esquerda
	    case 4: mov_x =  1; break; // direita
	    case 0: break;             // parado
	}

	// verifica colisão simples
	if (!place_meeting(x + mov_x * vel, y + mov_y * vel, obj_colision)) {
	    x += mov_x * vel;
	    y += mov_y * vel;
	} else {
	    dir = 0; // se bater em algo, para
	}
	}
}
