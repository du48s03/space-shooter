///create_beam(xpos, ypos, direc)
var xpos = argument[0];
var ypos = argument[1];
var direc = argument[2];

var inst = instance_create(xpos, ypos, obj_beam);
inst.direc = direc;
inst.hspeed = inst.default_spd * cos(inst.direc/180*pi);
inst.vspeed = - inst.default_spd * sin(inst.direc/180*pi);
inst.owner = id;
//show_debug_message("self = "+string(self));
//show_debug_message("id = "+string(id));


return inst;
