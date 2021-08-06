/// @description Handle enemy animation update end

// Only handle enemy animation if it's owner does exists
if enemy_animation_owner != -1 and instance_exists(enemy_animation_owner) {
	// Handle image facing based on animation owner horizontal speed
	if enemy_animation_owner.enemy_horizontal_speed != 0 and enemy_animation_owner.enemy_current_state != enemy_states.death {
		if sign(enemy_animation_owner.enemy_horizontal_speed) != sign(image_xscale) {
			image_xscale *= -1;
		}
	}
	
	// Handle enemy animation based on enemy current state and type/kind
	switch enemy_animation_owner.enemy_current_state {
		case enemy_states.spawn:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_spawn;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_spawn;
					break;
				case enemy_kind.ufo_hybrid:
					sprite_index = spr_enemy_ufo_hybrid_spawn;
					break;
			}
			break;
		case enemy_states.idle:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_idle;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_idle;
					break;
				case enemy_kind.ufo_hybrid:
					sprite_index = spr_enemy_ufo_hybrid_idle;
					break;
			}

			break;
		case enemy_states.sprint:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_sprint;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_sprint;
					break;
				case enemy_kind.ufo_hybrid:
					sprite_index = spr_enemy_ufo_hybrid_sprint;
					break;
			}

			break;
		case enemy_states.attack:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_attack;
					
					// Generate strike hitbox if it doesn't exists
					if (floor(image_index) >= sprite_get_number(sprite_index) - 2) and (enemy_animation_current_sprite == enemy_animation_last_sprite) {
						with enemy_animation_owner {
							if enemy_strike_hitbox == -1 {
								enemy_strike_hitbox = instance_create_layer(x + (sign(other.image_xscale) * 22), y, "Collision_Layer", obj_enemy_strike_hitbox);
								enemy_strike_hitbox.strike_hitbox_owner = id;
							}
						}
					}
					
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_attack;
					
					// Set animation correct direction before executing the laser shot
					var target = enemy_animation_owner.enemy_target_player;
					if target != -1 and instance_exists(target) {
						if target.x >= enemy_animation_owner.x {
							image_xscale = 1;
						} else {
							image_xscale = -1;
						}
					}
					
					// Generate laser if ufo shooter animation is on correct frame
					if (floor(image_index) == sprite_get_number(sprite_index) - 2) and !enemy_animation_owner.enemy_laser_shot_is_executed {
						// Generate laser with it's variables
						var laser_direction = sign(image_xscale);
						var laser = instance_create_layer(x + (10 * laser_direction), y, "Collision_Layer", obj_enemy_laser);
						laser.laser_horizontal_direction = laser_direction;
						
						// Update image frame and set laser shot variable to avoid laser duplication
						image_index++;
						enemy_animation_owner.enemy_laser_shot_is_executed = true;
					}
					
					break;
				case enemy_kind.ufo_hybrid:
					if !enemy_animation_owner.enemy_hybrid_is_shooting {
						sprite_index = spr_enemy_ufo_hybrid_attack_one;
					
						// Generate strike hitbox if it doesn't exists
						if (floor(image_index) >= sprite_get_number(sprite_index) - 2) and (enemy_animation_current_sprite == enemy_animation_last_sprite) {
							with enemy_animation_owner {
								if enemy_strike_hitbox == -1 {
									enemy_strike_hitbox = instance_create_layer(x + (sign(other.image_xscale) * 10), y + 19, "Collision_Layer", obj_enemy_strike_hitbox);
									enemy_strike_hitbox.strike_hitbox_owner = id;
								}
							}
						}
					} else {
						sprite_index = spr_enemy_ufo_hybrid_attack_two;
						
						// Set animation correct direction before executing the laser shot
						var target = enemy_animation_owner.enemy_target_player;
						if target != -1 and instance_exists(target) {
							if target.x >= enemy_animation_owner.x {
								image_xscale = 1;
							} else {
								image_xscale = -1;
							}
						}
					
						// Generate laser if ufo hybrid animation is on correct frame
						if (floor(image_index) == sprite_get_number(sprite_index) - 2) and !enemy_animation_owner.enemy_laser_shot_is_executed {
							// Generate laser with it's variables
							var laser_direction = sign(image_xscale);
							var laser = instance_create_layer(x + (10 * laser_direction), y - 12, "Collision_Layer", obj_enemy_laser);
							laser.laser_horizontal_direction = laser_direction;
						
							// Update image frame and set laser shot variable to avoid laser duplication
							image_index++;
							enemy_animation_owner.enemy_laser_shot_is_executed = true;
						}
					}
					break;
			}
			
			// Normalize enemy state if attack is finished
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				enemy_animation_owner.enemy_current_state = enemy_animation_owner.enemy_last_state;
				enemy_animation_owner.enemy_last_state = enemy_states.attack;
				enemy_animation_owner.enemy_hybrid_is_shooting = choose(true, false); // Choose attack kind for hybrid enemy dynamic
			}
			
			break;
		case enemy_states.death:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_death;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_death;
					break;
				case enemy_kind.ufo_hybrid:
					sprite_index = spr_enemy_ufo_hybrid_death;
					break;
			}
			
			// Hold last frame for death feeling
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				// Delete enemy after playing death animation
				with enemy_animation_owner {
					with enemy_spawner_owner {
						var dying_enemy_position_on_list = ds_list_find_index(enemy_spawner_generated_enemies_list, other.id);
						ds_list_delete(enemy_spawner_generated_enemies_list, dying_enemy_position_on_list);
					}
					
					instance_destroy();
				}
			}
			break;
	}
	
	// Update player animation current sprite
	enemy_animation_current_sprite = sprite_index;
	// Reset sprite animation if player animation last frame sprite is not the same as the current sprite
	if enemy_animation_last_sprite != enemy_animation_current_sprite {
		image_index = 0;
		enemy_animation_last_sprite = enemy_animation_current_sprite;
	}
	
	// Update player animation positioning based on player position
	x = enemy_animation_owner.x;
	y = enemy_animation_owner.y;
}