create_type(name)
{
    type = spawnstruct();
    type.name = name;
    type.instances = [];

    return type;
}

create_from_type(type)
{
    instance = spawnstruct();
    instance.type = type;
    type.instances[type.instances.size] = instance;
    return instance;
}

is_instance_of(instance, type)
{
    return isdefined(instance.type) && instance.type == type;
}