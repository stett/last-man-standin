// Get hex and direction (which is an int from 0 to 5 representing hex edges, starting with east)
var hex = argument0;
var dir = argument1;
var first = argument2;
globalvar kills;
globalvar points;

if (first) {
    kills = 0;
}

// Kill the current cowboy if there is one and this isn't the first shot
with (hex) {
    var cowboy = instance_place(x, y, Cowboy);
    if (cowboy != noone) {
        dir = cowboy.dir;
        if (first != true) {
        
            // Kill the cowboy
            with (cowboy) { instance_destroy(); }
            
            // Update the multiplier
            kills ++;
            /*if (multiplier < 2) {
                multiplier += 1;
            } else {
                multiplier *= multiplier;
            }*/
        }
    }
}

// If this is the first shot but there is no cowboy, then don't shoot, stupid.
if (cowboy == noone and first == true) {
    return noone;
}

// Scale the hex down
hex.scale = .6;

// Find the next hex to shoot
var next_hex = noone;
if (dir == 0) {
    next_hex = hex.east;
} else if (dir == 1) {
    next_hex = hex.southeast;
} else if (dir == 2) {
    next_hex = hex.southwest;
} else if (dir == 3) {
    next_hex = hex.west;
} else if (dir == 4) {
    next_hex = hex.northwest;
} else if (dir == 5) {
    next_hex = hex.northeast;
}

// If there was another hex, shoot it
if (next_hex != noone) {
    shoot(next_hex, dir, false);

// If ther wasn't another hex, add to the score
} else {
    points += kills * kills;
}
