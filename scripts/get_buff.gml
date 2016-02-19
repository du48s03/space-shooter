///obj_player.get_buff(buff)
var buff = argument[0]
switch(buff.object_index){
    case obj_health_pack:
        hp+=health_pack_eff;
        hp = min(hp, max_hp);
        break;
    case obj_speed_up:
        status[1] = speed_up_time;
        break;
    case obj_scatter_shot:
        status[2] = scatter_shot_time;
        break;
    case obj_anti_gravity:
        status[3] = anti_gravity_time;
        break;
    case obj_fast_regen:
        status[4] = fast_regen_time;
        break;
}
audio_play_sound(snd_get_buff, 1, false);
