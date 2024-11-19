#include data_type;

create_perk_machine()
{
    if(!isdefined(level.types)) level.types = spawnstruct();
    if(!isdefined(level.types.perk_machine)) level.types.perk_machine = create_type("Perk Machine");

    machine = create_from_type(level.types.perk_machine);

    // --- Models ---
    machine.models = spawnstruct();
    machine.models.on = "";
    machine.models.off = "";
    machine.models.collision = "zm_collision_perks1";
    // --------------

    // --- Entities ---
    machine.entities = spawnstruct();
    machine.entities.machine = spawn("script_model", (0, 0, 0));
    machine.entities.collision = spawn("script_model", (0, 0, 0));
    machine.entities.collision set_model(machine.models.off);
    // ----------------

    // --- Callbacks ---
    machine.callbacks = spawnstruct();
    machine.callbacks.can_buy = ::default_perk_machine_can_buy;
    machine.callbacks.trigger_text = ::default_perk_machine_trigger_think;
    // -----------------

    // --- Sounds ---
    machine.sounds = spawnstruct();
    machine.sounds.buy = "";
    machine.sounds.sting = "";
    machine.sounds.jingle = "";
    // --------------

    // --- Variables ---
    machine.cost = 500;
    machine.perks = [];
    machine.powered = false;
    // -----------------

    if(!isdefined(level.perk_machines)) level.perk_machines = [];
    level.perk_machines[level.perk_machines.size] = machine;

    return machine;
}

set_perk_machine_models(off_model, on_model, collision_model)
{
    if(!is_instance_of(self, level.types.perk_machine)) return;

    self.models.on = on_model;
    self.models.off = off_model;
    if(isdefined(collision_model)) self.models.collision = collision_model;

    self reload_perk_machine();
}

reload_perk_machine()
{
    if(!is_instance_of(self, level.types.perk_machine)) return;

    self.entities.machine set_model(self.powered ? self.models.on : self.models.off);
    self.entities.collision set_model(self.models.collision);
}

set_machine_position(x, y, z)
{
    if(!is_instance_of(self, level.types.perk_machine)) return;

    self.entities.machine.origin = (x, y, z);
    self.entities.collision.origin = (x, y, z);
}