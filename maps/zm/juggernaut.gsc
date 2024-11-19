#include utilities\perks\perk;
#include utilities\perks\machine;

#define PERK_ID "specialty_juggernault"
#define PERK_COST 2500
#define PERK_NAME &"ZOMBIE_PERK_JUGGERNAUT"

#define PERK_ICON "specialty_juggernaut_zombies"
#define PERK_BOTTLE "zombie_perk_bottle_jugg"
#define PERK_MACHINE_OFF "zombie_vending_jugg"
#define PERK_MACHINE_ON "zombie_vending_jugg_on"
// #define PERK_MACHINE_COLLISION "zm_collision_perks1"

init()
{
    precachestring(PERK_NAME);
    precacheshader(PERK_ICON);
    precacheitem(PERK_BOTTLE);
    precachemodel(PERK_MACHINE_ON);
    precachemodel(PERK_MACHINE_OFF);
    // precachemodel(PERK_MACHINE_COLLISION);

    juggernault = register_perk(PERK_ID);
    perk_machine = create_perk_machine();
    perk_machine.models.on = PERK_MACHINE_ON;
    perk_machine.models.off = PERK_MACHINE_OFF;
    perk_machine set_machine_position(0, 0, 0);
    perk_machine set_power_state(false);
    perk_machine reload_perk_machine();
    // perk_machine.models.collision = PERK_MACHINE_COLLISION;

    fast_descriptor = perk_machine add_perk(juggernault);
    fast_descriptor.cost = PERK_COST;
    fast_descriptor.bottle_model = PERK_BOTTLE;
}