///create_weapon(xpos, ypos, direc, obj)
var xpos = argument[0];
var ypos = argument[1];
var direc = argument[2];
var obj = argument[3];

var inst = instance_create(xpos, ypos, obj);
inst.direc = direc;
inst.hspeed = inst.default_spd * cos(inst.direc/180*pi);
inst.vspeed = - inst.default_spd * sin(inst.direc/180*pi);
inst.owner = id;
//show_debug_message("self = "+string(self));
//show_debug_message("id = "+string(id));


return inst;
