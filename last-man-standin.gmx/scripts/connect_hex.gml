var hex = argument0;
var adj;

// Check for adj to the right
adj = find_hex_neighbor(hex, 56*2, 0);
if (adj != noone) {
    hex.east = adj;
    adj.west = hex;
}

// Check for adj below and to the right
adj = find_hex_neighbor(hex, 56, 32*3);
if (adj != noone) {
    hex.southeast = adj;
    adj.northwest = hex;
}

// Check for adj below and to the left
adj = find_hex_neighbor(hex, -56, 32*3);
if (adj != noone) {
    hex.southwest = adj;
    adj.northeast = hex;
}
