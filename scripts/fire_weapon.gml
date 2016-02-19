///obj_player.fire_weapon()
var selected_weapon = ctrl_setting.weapon_chosen[self.player_id,now_weapon];
var weapon_ind = ds_map_find_value(ctrl_setting.weapon_index,selected_weapon);
//check for cool down and fuel
if(self.weapon_timer[now_weapon] != 0 || self.fuel<ctrl_setting.weapon_cost[weapon_ind]) return noone;





//---creating the projectile
var len = (sprite_get_width(object_get_sprite(selected_weapon))+sprite_get_width(sprite_index))/2+5;
var obj = create_weapon( x+len*cos(direc/180*pi),
                y-len*sin(direc/180*pi),direc, selected_weapon);
if(obj.snd != noone)
    audio_play_sound(obj.snd, 1, false);
//apply buffs, etc
if(status[2] > 0){
    
    var obj1 = create_weapon(  x+len*cos(direc/180*pi),
                    y-len*sin(direc/180*pi),direc+30, selected_weapon);
    var obj2 = create_weapon(  x+len*cos(direc/180*pi),
                    y-len*sin(direc/180*pi),direc-30, selected_weapon);
    var r = power(power(sprite_width,2)+power(sprite_height,2),0.5)+3;

    /*
    with(obj){
        if(place_meeting(x,y,obj1)){
            var angle = direction-obj1.direction;
            var r = power(power(sprite_width,2)+power(sprite_height,2),0.5)+3;
            obj1.x+=(hspeed - speed*cos(angle)*obj1.hspeed)*r;
            obj1.y+=(vspeed - speed*cos(angle)*obj1.vspeed)*r;
        }
        if(place_meeting(x,y,obj2)){
            var angle = direction-obj2.direction;
            var r = power(power(sprite_width,2)+power(sprite_height,2),0.5)+3;
            obj2.x+=(hspeed - speed*cos(angle)*obj2.hspeed)*r;
            obj2.y+=(vspeed - speed*cos(angle)*obj2.vspeed)*r;
        }
    }
    */
}

//---setup timer and consuming power
self.weapon_timer[now_weapon] = ctrl_setting.weapon_timers[ds_map_find_value(ctrl_setting.weapon_index, selected_weapon)];
self.fuel -= ctrl_setting.weapon_cost[weapon_ind];
