last_dir = 0; // 0 = parado, 1 = cima, 2 = baixo, 3 = esquerda, 4 = direita

moving = false;
attacking = false;
attack_cooldown = 0; // Variável para controlar o tempo do ataque
view_zoom = 0
can_take_damage = true; 
damage_cooldown = 30;   // 30 steps de invulnerabilidade (~0,5s se 60fps)

global.dano = 1;
global.protaVel = 4;
global.vida = 5;
global.xp = 0;
global.kills = 0;

global.time = false;      
global.menu = 0;     // 0 = nada selecionado, 1-4 = opção escolhida


