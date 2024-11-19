#include utilities\perks\machine;

default_perk_give(perk)
{
    if(!is_instance_of(perk, level.types.perk)) return;

    bottle = get_perk_bottle(perk);
}

default_perk_take(perk)
{
    if(!is_instance_of(perk, level.types.perk)) return;
}

perk_exists(perk_id)
{
    if(!isstring(perk_id)) return false;
    if(!isdefined(level.perks)) return false;

    foreach(_, perk in level.perks)
    {
        if(perk.id != perk_id) continue;
        return true;
    }

    return false;
}

register_perk(perk_id)
{
    if(!isstring(perk_id)) return;
    if(perk_exists(perk_id)) return;

    if(!isdefined(level.types)) level.types = spawnstruct();
    if(!isdefined(level.types.perk)) level.types.perk = create_type("Perk");

    perk = create_from_type(level.types.perk);
    perk.id = perk_id;
    perk.give = ::default_perk_give;
    perk.take = ::default_perk_take;

    if(!isdefined(level.perks)) level.perks = [];
    level.perks[level.perks.size] = perk;

    return perk;
}