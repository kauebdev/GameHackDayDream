
if (attacking) {
    var dx = 0;
    var dy = 0;
    
    switch(sprite_index) {
        case spr_upattack: dy = -20; break;
        case spr_downattack: dy = 20; break;
        case spr_leftattack: dx = -20; break;
        case spr_rightattack: dx = 20; break;
    }

    var _inimigo = instance_place(x + dx, y + dy, obj_inimigo);
    if (_inimigo != noone) {
        _inimigo.hp -= global.dano;
        if (_inimigo.hp <= 0) { 
		instance_destroy(_inimigo);
		global.xp +=1;
		global.kills +=1;
		if (global.xp >= 5) {
				global.time = false;
				global.xp = 0;
		}
		} 
		
    }
}