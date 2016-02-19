///obj_listener.change_weapon_sel(inc)
var inc = argument[0];
audio_play_sound(snd_change_option, 80, false);
if(inc){
    selected_weapon[weap_cursor]=(selected_weapon[weap_cursor]+1)%(num_weapon+1);
    while(true){
        var used = false;
        for(i=0;i<3;i++){
            if(i!=weap_cursor 
                && selected_weapon[i] == selected_weapon[weap_cursor]
                && selected_weapon[weap_cursor] != num_weapon
                ){
                used = true;
                break;   
            }
        }
        if(used){
            selected_weapon[weap_cursor]=(selected_weapon[weap_cursor]+1)%(num_weapon+1);
            /*
            show_debug_message( string(selected_weapon[0])+","+
                                string(selected_weapon[1])+","+
                                string(selected_weapon[2]));
            show_message("");
            */
        }
        else break;
    }
}
else{
    selected_weapon[weap_cursor]-= 1;
    if(selected_weapon[weap_cursor]<0) selected_weapon[weap_cursor] = num_weapon;
    while(true){
        var used = false;
        for(i=0;i<3;i++){
            if(i!=weap_cursor 
                && selected_weapon[i] == selected_weapon[weap_cursor]
                && selected_weapon[weap_cursor] != num_weapon
                ){
                used = true;
                break;   
            }
        }
        if(used) {
            selected_weapon[weap_cursor]-= 1;
            if(selected_weapon[weap_cursor]<0) selected_weapon[weap_cursor] = num_weapon;
            /*
            show_debug_message( string(selected_weapon[0])+","+
                                string(selected_weapon[1])+","+
                                string(selected_weapon[2]));
            show_message("");
            */
        }
        else break;
    }
}
