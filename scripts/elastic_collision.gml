///elastic_collision(obj1,obj2,m1,m2)
var obj1 = argument[0];
var obj2 = argument[1];
var m1 = argument[2];
var m2 = argument[3];

var dx = obj1.x - obj2.x;
var dy = obj1.y - obj2.y;

var perp1_x = (obj1.hspeed*dx+obj1.vspeed*dy) /(dx*dx+dy*dy)*dx;
var perp1_y = (obj1.hspeed*dx+obj1.vspeed*dy) /(dx*dx+dy*dy)*dy;
var perp2_x = (obj2.hspeed*dx+obj2.vspeed*dy) /(dx*dx+dy*dy)*dx;
var perp2_y = (obj2.hspeed*dx+obj2.vspeed*dy) /(dx*dx+dy*dy)*dy;

var perp1 = power(power(perp1_x,2)+power(perp1_y,2),0.5);
var perp2 = power(power(perp2_x,2)+power(perp2_y,2),0.5);
if((obj1.hspeed*dx+obj1.vspeed*dy)<0) perp1 *= -1;
if((obj2.hspeed*dx+obj2.vspeed*dy)<0) perp2 *= -1;


if(m1 == -1)//infinite
{
    var perp1_end = perp1;
    var perp2_end = -perp2+2*perp1;
}
else if (m2 == -1)//infinite
{
    var perp2_end = perp2;
    var perp1_end = -perp1+2*perp2;
}
else {
    var perp1_end = (perp1*(m1-m2)+2*m2*perp2)/(m1+m2);
    var perp2_end = (perp2*(m2-m1)+2*m1*perp1)/(m1+m2);
}
var cosine = dx/power(dx*dx+dy*dy,0.5);
var sine = dy/power(dx*dx+dy*dy,0.5);
var perp1_x_end = perp1_end*cosine;
var perp1_y_end = perp1_end*sine;
var perp2_x_end = perp2_end*cosine;
var perp2_y_end = perp2_end*sine;

/*show_debug_message("d :("+string(dx)+", "+string(dy)+")"); 
show_debug_message("v1 :("+string(obj1.hspeed)+", "+string(obj1.vspeed)+")"); 
show_debug_message("v2 :("+string(obj2.hspeed)+", "+string(obj2.vspeed)+")"); 
show_debug_message("perp1 :("+string(perp1_x)+", "+string(perp1_y)+")"); 
show_debug_message("perp2 :("+string(perp2_x)+", "+string(perp2_y)+")"); 
show_debug_message("perp1_end :("+string(perp1_x_end)+", "+string(perp1_y_end)+")"); 
show_debug_message("perp2_end :("+string(perp2_x_end)+", "+string(perp2_y_end)+")"); 
*/
//show_message("collision detected:");

obj1.hspeed += -perp1_x + perp1_x_end;
obj1.vspeed += -perp1_y + perp1_y_end;
obj2.hspeed += -perp2_x + perp2_x_end;
obj2.vspeed += -perp2_y + perp2_y_end;
