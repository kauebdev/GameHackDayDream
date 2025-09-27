// Incrementa o contador
spawn_timer++;

// Verifica se é hora de gerar um inimigo
if (spawn_timer >= spawn_interval) 
{
    // Conta os inimigos na sala
    if (instance_number(obj_inimigo) < max_inimigos) 
    {
        // Coordenadas aleatórias dentro dos limites
        var _spawn_x = irandom_range(spawn_min_x, spawn_max_x);
        var _spawn_y = irandom_range(spawn_min_y, spawn_max_y);

        // Verifica se a posição está livre antes de gerar
        if (!place_meeting(_spawn_x + 2, _spawn_y + 2, obj_colision) && global.kills <= 10) 
        {
            // Cria o inimigo
            instance_create_layer(_spawn_x + 4, _spawn_y + 4, "inimigos", obj_inimigo);
        }
    }

    // Reseta o contador
    spawn_timer = 0;
}
