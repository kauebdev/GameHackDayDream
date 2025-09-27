var vida_total = 4; // número máximo de vidas
var spacing = 40;   // espaço entre os ícones
var start_x = 50;
var start_y = 20;

for (var i = 0; i < global.vida; i++) {
    draw_sprite(spr_vida, 0, start_x + i * spacing, start_y);
}

// Reinicia a sala se vida acabar
if (global.vida <= 0) {
    room_goto(rm_morte);
}