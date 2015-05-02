var hex = argument0;
var dx = argument1;
var dy = argument2;

var hx = hex.x;
var hy = hex.y;
var adj = noone;

with (hex) {
    while (adj == noone and hx > 0 and hx < room_width and hy > 0 and hy < room_height) {
        hx += dx;
        hy += dy;
        
        adj = instance_place(hx, hy, Hex);
        if (adj != noone) {
            break;
        }
    }
}

return adj;