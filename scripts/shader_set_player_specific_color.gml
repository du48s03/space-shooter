///shader_set_player_specific_color(player_id)
var player_id = argument[0];
shader_set(HueConverter);
var old_hue_handle = shader_get_uniform(HueConverter,"u_OldHue");
var new_hue_handle = shader_get_uniform(HueConverter,"u_NewHue");
var tol_handle = shader_get_uniform(HueConverter,"u_Tolerance");
shader_set_uniform_f(old_hue_handle,ctrl_setting.hue_replace);
if(player_id != -1)
    shader_set_uniform_f(new_hue_handle,ctrl_setting.player_hue[player_id]);
else
    shader_set_uniform_f(new_hue_handle,ctrl_setting.player_hue[array_length_1d(ctrl_setting.player_hue)-1]);
shader_set_uniform_f(tol_handle,ctrl_setting.hue_tol);
