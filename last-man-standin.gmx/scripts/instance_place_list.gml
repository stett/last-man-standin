var _x = argument0;
var _y = argument1;
var object = argument2;
var instance = noone;
var instance_list = noone;
var instance_list_n = 0;

// Deactivate every result of instance_place until there are no more results,
// storing the results in an array along the way.
instance = instance_place(_x, _y, object);
while (instance) {
    instance_list[instance_list_n] = instance;
    instance_list_n ++;
    instance_deactivate_object(instance);
    instance = instance_place(_x, _y, object)
}

// Re-activate each of the instances
for (var n = 0; n < instance_list_n; n ++) {
    instance_activate_object(instance_list[n]);
}

// Return the list of results
return instance_list;
