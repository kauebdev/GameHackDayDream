if (!global.time) {

    if (mouse_check_button_pressed(mb_left)) {
        var mx = window_mouse_get_x();
        var my = window_mouse_get_y();

			var sprite_size = 200; // tamanho do sprite 200x200

			// verifica clique em cada sprite
			if (mx > start_x && mx < start_x + sprite_size && my > start_y && my < start_y + sprite_size) {
			    global.menu = 1;
			}
			else if (mx > start_x + spacing && mx < start_x + spacing + sprite_size && my > start_y && my < start_y + sprite_size) {
			    global.menu = 2;
			}
			else if (mx > start_x + spacing * 2 && mx < start_x + spacing * 2 + sprite_size && my > start_y && my < start_y + sprite_size) {
			    global.menu = 3;
			}
			
        // executa ação e descongela
        if (global.menu != 0) {
            switch(global.menu) {
                case 1:
                    global.vida += 1
                    break;
                case 2:
                    global.dano +=1
                    break;
                case 3:
                    global.protaVel +=1
                    break;
            }
			global.time = true;   // descongela
            global.menu = 0;  // reseta


        }

    }
}