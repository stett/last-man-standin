var cowboy = argument0;
var hex = argument1;
var should_shoot = argument2;

cowboy.hex = hex;
cowboy.x = hex.x;
cowboy.y = hex.y;

if (should_shoot) {
    shoot(hex, 0, true);
}
