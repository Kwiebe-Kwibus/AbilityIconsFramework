local AbilityIconsFramework = AbilityIconsFramework

AbilityIconsFramework.SAVEDVARIABLES_VERSION = 1.5

-- Constants
AbilityIconsFramework.MIN_INDEX = 3                  -- First ability index
AbilityIconsFramework.MAX_INDEX = 8                  -- Last ability: 7, Ultimate: 8
AbilityIconsFramework.SLOT_INDEX_OFFSET = 20         -- Offset for backbar abilities indices
AbilityIconsFramework.COMPANION_INDEX_OFFSET = 30    -- Offset for companion ultimate

AbilityIconsFramework.ICON_PACKS = {}
AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE = {}
--- Holds all custom icon configurations for scribed skills.
AbilityIconsFramework.CUSTOM_ABILITY_ICONS = {}

-- Path shortcuts
local ESO_ROOT = "/esoui/art/icons/"
local ADDON_ROOT = "/AbilityIconsFramework/icons/"

function hasIcon(PackIcons, name)
    for index, value in ipairs(PackIcons) do
        if value == name then
            return true
        end
    end
    return false
end

local function esoIcon(name) return ESO_ROOT .. name end
local function addonIcon(name)
    for PackDirectory, PackIcons in pairs(AbilityIconsFramework.ICON_PACKS) do
        if name == 'ability_necromancer_002.dds' then
            d('Processing ability_necromancer_002.dds')
        end
        if hasIcon(PackIcons, name) then
            if name == 'ability_necromancer_002.dds' then
                d('ability_necromancer_002.dds has been found in the pack !')
            end
            icon = PackDirectory .. name
            if name == 'ability_necromancer_002.dds' then
                d('icon : ', icon)
            end
            return icon
        end
    end
    return ADDON_ROOT .. name
end

-- Default icons
local DEFAULT_ICONS = {
    BANNER_BEARER = esoIcon("ability_grimoire_support.dds"),
    ELEMENTAL_EXPLOSION = esoIcon("ability_grimoire_staffdestro.dds"),
    MENDERS_BOND = esoIcon("ability_grimoire_staffresto.dds"),
    SHIELD_THROW = esoIcon("ability_grimoire_1handed.dds"),
    SMASH = esoIcon("ability_grimoire_2handed.dds"),
    SOUL_BURST = esoIcon("ability_grimoire_soulmagic2.dds"),
    TORCHBEARER = esoIcon("ability_grimoire_fightersguild.dds"),
    TRAMPLE = esoIcon("ability_grimoire_assault.dds"),
    TRAVELING_KNIFE = esoIcon("ability_grimoire_dualwield.dds"),
    ULFSILDS_CONTINGENCY = esoIcon("ability_grimoire_magesguild.dds"),
    VAULT = esoIcon("ability_grimoire_bow.dds"),
    WIELD_SOUL = esoIcon("ability_grimoire_soulmagic1.dds")
}

-- Effect types
local EFFECT = {
    FLAME = "flame",
    FROST = "frost",
    SHOCK = "shock",
    MAGIC = "magic",
    HEAL = "heal",
    RESOURCES = "resources",
    ULTIMATE = "ultimate",
    STUN = "stun",
    IMMOBILIZE = "immobilize",
    DISPEL = "dispel",
    SHIELD = "shield",
    PHYSICAL = "physical",
    MULTITARGET = "multi-target",
    BLEED = "bleed",
    TRAUMA = "trauma",
    POISON = "poison",
    DISEASE = "disease",
    DEFAULT = "default"
}

AbilityIconsFramework.DEFAULT = EFFECT.DEFAULT

-- Configuration templates
AbilityIconsFramework.DEFAULT_ADDON_CONFIG = {
    version = AbilityIconsFramework.SAVEDVARIABLES_VERSION,
    saveSettingsGlobally = false,
}

-- Consolidated table for icon names, skill names, main category, class, and skill tree
	AbilityIconsFramework.ICON_TO_SKILL_NAME = {
    -- Weapon Skills
    ["ability_bow_rapid_fire.dds"] = {
        skillName = "Rapid Fire",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_ballista.dds"] = {
        skillName = "Ballista",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_toxic_barrage.dds"] = {
        skillName = "Toxic Barrage",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_snipe.dds"] = {
        skillName = "Snipe",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_focused_aim.dds"] = {
        skillName = "Focused Aim",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_lethal_arrow.dds"] = {
        skillName = "Lethal Arrow",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_volley.dds"] = {
        skillName = "Volley",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_arrow_barrage.dds"] = {
        skillName = "Arrow Barrage",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_endless_hail.dds"] = {
        skillName = "Endless Hail",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_scatter_shot.dds"] = {
        skillName = "Scatter Shot",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_draining_shot.dds"] = {
        skillName = "Draining Shot",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_magnum_shot.dds"] = {
        skillName = "Magnum Shot",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_arrow_spray.dds"] = {
        skillName = "Arrow Spray",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_acid_spray.dds"] = {
        skillName = "Acid Spray",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_bombard.dds"] = {
        skillName = "Bombard",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_poison_arrow.dds"] = {
        skillName = "Poison Arrow",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_poison_injection.dds"] = {
        skillName = "Poison Injection",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_venom_arrow.dds"] = {
        skillName = "Venom Arrow",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_vault.dds"] = {
        skillName = "Vault",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_vinedusk_training.dds"] = {
        skillName = "Vinedusk Training",
        position = 20,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_accuracy.dds"] = {
        skillName = "Accuracy",
        position = 21,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_ranger.dds"] = {
        skillName = "Ranger",
        position = 22,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_hawk_eye.dds"] = {
        skillName = "Hawk Eye",
        position = 23,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_hasty_retreat.dds"] = {
        skillName = "Hasty Retreat",
        position = 24,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },

    -- Destruction Staff Skills
    ["ability_destructionstaff_elemental_storm.dds"] = {
        skillName = "Elemental Storm",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_rage.dds"] = {
        skillName = "Elemental Rage",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_eye_of_the_storm.dds"] = {
        skillName = "Eye of the Storm",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_force_shock.dds"] = {
        skillName = "Force Shock",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_crushing_shock.dds"] = {
        skillName = "Crushing Shock",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_force_pulse.dds"] = {
        skillName = "Force Pulse",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_wall_of_elements.dds"] = {
        skillName = "Wall of Elements",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_blockade.dds"] = {
        skillName = "Elemental Blockade",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_unstable_wall_of_elements.dds"] = {
        skillName = "Unstable Wall of Elements",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_destructive_touch.dds"] = {
        skillName = "Destructive Touch",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_destructive_clench.dds"] = {
        skillName = "Destructive Clench",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_destructive_reach.dds"] = {
        skillName = "Destructive Reach",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_weakness_to_elements.dds"] = {
        skillName = "Weakness to Elements",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_drain.dds"] = {
        skillName = "Elemental Drain",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_susceptibility.dds"] = {
        skillName = "Elemental Susceptibility",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_impulse.dds"] = {
        skillName = "Impulse",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_ring.dds"] = {
        skillName = "Elemental Ring",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_008_b.dds"] = {
        skillName = "Pulsar",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_explosion.dds"] = {
        skillName = "Elemental Explosion",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_tri_focus.dds"] = {
        skillName = "Tri Focus",
        position = 20,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_penetrating_magic.dds"] = {
        skillName = "Penetrating Magic",
        position = 21,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_elemental_force.dds"] = {
        skillName = "Elemental Force",
        position = 22,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_ancient_knowledge.dds"] = {
        skillName = "Ancient Knowledge",
        position = 23,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_destruction_expert.dds"] = {
        skillName = "Destruction Expert",
        position = 24,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },

    -- Dual Wield Skills
    ["ability_dualwield_lacerate.dds"] = {
        skillName = "Lacerate",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_rend.dds"] = {
        skillName = "Rend",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_thrive_in_chaos.dds"] = {
        skillName = "Thrive in Chaos",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_flurry.dds"] = {
        skillName = "Flurry",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_bloodthirst.dds"] = {
        skillName = "Bloodthirst",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_rapid_strikes.dds"] = {
        skillName = "Rapid Strikes",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_twin_slashes.dds"] = {
        skillName = "Twin Slashes",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_blood_craze.dds"] = {
        skillName = "Blood Craze",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_rending_slashes.dds"] = {
        skillName = "Rending Slashes",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_whirlwind.dds"] = {
        skillName = "Whirlwind",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_steel_tornado.dds"] = {
        skillName = "Steel Tornado",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_whirling_blades.dds"] = {
        skillName = "Whirling Blades",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_blade_cloak.dds"] = {
        skillName = "Blade Cloak",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_deadly_cloak.dds"] = {
        skillName = "Deadly Cloak",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_004_a.dds"] = {
        skillName = "Quick Cloak",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_hidden_blade.dds"] = {
        skillName = "Hidden Blade",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_flying_blade.dds"] = {
        skillName = "Flying Blade",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_shrouded_daggers.dds"] = {
        skillName = "Shrouded Daggers",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_traveling_knife.dds"] = {
        skillName = "Traveling Knife",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_slaughter.dds"] = {
        skillName = "Slaughter",
        position = 20,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_dual_wield_expert.dds"] = {
        skillName = "Dual Wield Expert",
        position = 21,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_controlled_fury.dds"] = {
        skillName = "Controlled Fury",
        position = 22,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_ruffian.dds"] = {
        skillName = "Ruffian",
        position = 23,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_twin_blade_and_blunt.dds"] = {
        skillName = "Twin Blade and Blunt",
        position = 24,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },

    -- One Hand and Shield Skills
    ["ability_onehandshield_shield_wall.dds"] = {
        skillName = "Shield Wall",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_shield_discipline.dds"] = {
        skillName = "Shield Discipline",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_spell_wall.dds"] = {
        skillName = "Spell Wall",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_puncture.dds"] = {
        skillName = "Puncture",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_pierce_armor.dds"] = {
        skillName = "Pierce Armor",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_ransack.dds"] = {
        skillName = "Ransack",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_low_slash.dds"] = {
        skillName = "Low Slash",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_deep_slash.dds"] = {
        skillName = "Deep Slash",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_heroic_slash.dds"] = {
        skillName = "Heroic Slash",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_defensive_posture.dds"] = {
        skillName = "Defensive Posture",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_absorb_missile.dds"] = {
        skillName = "Absorb Missile",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_defensive_stance.dds"] = {
        skillName = "Defensive Stance",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_shield_charge.dds"] = {
        skillName = "Shield Charge",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_invasion.dds"] = {
        skillName = "Invasion",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_shielded_assault.dds"] = {
        skillName = "Shielded Assault",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_power_bash.dds"] = {
        skillName = "Power Bash",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_power_slam.dds"] = {
        skillName = "Power Slam",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_reverberating_bash.dds"] = {
        skillName = "Reverberating Bash",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_onehandshield_shield_throw.dds"] = {
        skillName = "Shield Throw",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },

    -- Restoration Staff Skills
    ["ability_restorationstaff_panacea.dds"] = {
        skillName = "Panacea",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_life_giver.dds"] = {
        skillName = "Life Giver",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_lights_champion.dds"] = {
        skillName = "Light's Champion",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_grand_healing.dds"] = {
        skillName = "Grand Healing",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_healing_springs.dds"] = {
        skillName = "Healing Springs",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_004b.dds"] = {
        skillName = "Illustrious Healing",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_regeneration.dds"] = {
        skillName = "Regeneration",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_002a.dds"] = {
        skillName = "Radiating Regeneration",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_rapid_regeneration.dds"] = {
        skillName = "Rapid Regeneration",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_blessing_of_protection.dds"] = {
        skillName = "Blessing of Protection",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_blessing_of_restoration.dds"] = {
        skillName = "Blessing of Restoration",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_003_b.dds"] = {
        skillName = "Combat Prayer",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_steadfast_ward.dds"] = {
        skillName = "Steadfast Ward",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_healing_ward.dds"] = {
        skillName = "Healing Ward",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_ward_ally.dds"] = {
        skillName = "Ward Ally",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_force_siphon.dds"] = {
        skillName = "Force Siphon",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_quick_siphon.dds"] = {
        skillName = "Quick Siphon",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_siphon_spirit.dds"] = {
        skillName = "Siphon Spirit",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_menders_bond.dds"] = {
        skillName = "Mender's Bond",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },

    -- Two Handed Skills
    ["ability_twohanded_berserker_strike.dds"] = {
        skillName = "Berserker Strike",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_berserker_rage.dds"] = {
        skillName = "Berserker Rage",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_onslaught.dds"] = {
        skillName = "Onslaught",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_uppercut.dds"] = {
        skillName = "Uppercut",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_dizzying_swing.dds"] = {
        skillName = "Dizzying Swing",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_wrecking_blow.dds"] = {
        skillName = "Wrecking Blow",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_critical_charge.dds"] = {
        skillName = "Critical Charge",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_critical_rush.dds"] = {
        skillName = "Critical Rush",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_stampede.dds"] = {
        skillName = "Stampede",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_cleave.dds"] = {
        skillName = "Cleave",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_brawler.dds"] = {
        skillName = "Brawler",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_carve.dds"] = {
        skillName = "Carve",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_reverse_slash.dds"] = {
        skillName = "Reverse Slash",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_executioner.dds"] = {
        skillName = "Executioner",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_reverse_slice.dds"] = {
        skillName = "Reverse Slice",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_momentum.dds"] = {
        skillName = "Momentum",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_forward_momentum.dds"] = {
        skillName = "Forward Momentum",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_rally.dds"] = {
        skillName = "Rally",
        position = 18,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_twohanded_smash.dds"] = {
        skillName = "Smash",
        position = 19,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },

    -- Alliance War Skills
    ["ability_alliancewar_warhorn.dds"] = {
        skillName = "War Horn",
        position = 1,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_aggressive_horn.dds"] = {
        skillName = "Aggressive Horn",
        position = 2,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_sturdy_horn.dds"] = {
        skillName = "Sturdy Horn",
        position = 3,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_rapid_maneuver.dds"] = {
        skillName = "Rapid Maneuver",
        position = 4,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_charging_maneuver.dds"] = {
        skillName = "Charging Maneuver",
        position = 5,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_retreating_maneuver.dds"] = {
        skillName = "Retreating Maneuver",
        position = 6,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_vigor.dds"] = {
        skillName = "Vigor",
        position = 7,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_echoing_vigor.dds"] = {
        skillName = "Echoing Vigor",
        position = 8,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_resolving_vigor.dds"] = {
        skillName = "Resolving Vigor",
        position = 9,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_caltrops.dds"] = {
        skillName = "Caltrops",
        position = 10,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_001_a.dds"] = {
        skillName = "Anti-Cavalry Caltrops",
        position = 11,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_razor_caltrops.dds"] = {
        skillName = "Razor Caltrops",
        position = 12,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_magicka_detonation.dds"] = {
        skillName = "Magicka Detonation",
        position = 13,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_inevitable_detonation.dds"] = {
        skillName = "Inevitable Detonation",
        position = 14,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_proximity_detonation.dds"] = {
        skillName = "Proximity Detonation",
        position = 15,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_alliancewar_trample.dds"] = {
        skillName = "Trample",
        position = 16,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },

    -- Support Skills
    ["ability_alliancewar_barrier.dds"] = {
        skillName = "Barrier",
        position = 1,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_006_a.dds"] = {
        skillName = "Replenishing Barrier",
        position = 2,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_006_b.dds"] = {
        skillName = "Reviving Barrier",
        position = 3,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_banner_bearer.dds"] = {
        skillName = "Banner Bearer",
        position = 4,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_siege_shield.dds"] = {
        skillName = "Siege Shield",
        position = 5,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_propelling_shield.dds"] = {
        skillName = "Propelling Shield",
        position = 6,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_siege_weapon_shield.dds"] = {
        skillName = "Siege Weapon Shield",
        position = 7,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_purge.dds"] = {
        skillName = "Purge",
        position = 8,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_cleanse.dds"] = {
        skillName = "Cleanse",
        position = 9,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_efficient_purge.dds"] = {
        skillName = "Efficient Purge",
        position = 10,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_guard.dds"] = {
        skillName = "Guard",
        position = 11,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_mystic_guard.dds"] = {
        skillName = "Mystic Guard",
        position = 12,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_stalwart_guard.dds"] = {
        skillName = "Stalwart Guard",
        position = 13,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_revealing_flare.dds"] = {
        skillName = "Revealing Flare",
        position = 14,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_blinding_flare.dds"] = {
        skillName = "Blinding Flare",
        position = 15,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_alliancewar_lingering_flare.dds"] = {
        skillName = "Lingering Flare",
        position = 16,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },

    -- Guild Skills
    ["ability_fightersguild_dawnbreaker.dds"] = {
        skillName = "Dawnbreaker",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_dawnbreaker_smiting.dds"] = {
        skillName = "Dawnbreaker of Smiting",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_005_a.dds"] = {
        skillName = "Flawless Dawnbreaker",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_silver_bolts.dds"] = {
        skillName = "Silver Bolts",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_silver_leash.dds"] = {
        skillName = "Silver Leash",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_silver_shards.dds"] = {
        skillName = "Silver Shards",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_circle_of_protection.dds"] = {
        skillName = "Circle of Protection",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_001_b.dds"] = {
        skillName = "Ring of Preservation",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_turn_evil.dds"] = {
        skillName = "Turn Evil",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_expert_hunter.dds"] = {
        skillName = "Expert Hunter",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_002_b.dds"] = {
        skillName = "Camouflaged Hunter",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_evil_hunter.dds"] = {
        skillName = "Evil Hunter",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_trap_beast.dds"] = {
        skillName = "Trap Beast",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_004_a.dds"] = {
        skillName = "Barbed Trap",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_lightweight_beast_trap.dds"] = {
        skillName = "Lightweight Beast Trap",
        position = 15,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_torchbearer.dds"] = {
        skillName = "Torchbearer",
        position = 16,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },

    -- Mages Guild Skills
    ["ability_magesguild_meteor.dds"] = {
        skillName = "Meteor",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_ice_comet.dds"] = {
        skillName = "Ice Comet",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_shooting_star.dds"] = {
        skillName = "Shooting Star",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_magelight.dds"] = {
        skillName = "Magelight",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_inner_light.dds"] = {
        skillName = "Inner Light",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_radiant_magelight.dds"] = {
        skillName = "Radiant Magelight",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_entropy.dds"] = {
        skillName = "Entropy",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_degeneration.dds"] = {
        skillName = "Degeneration",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_structured_entropy.dds"] = {
        skillName = "Structured Entropy",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_fire_rune.dds"] = {
        skillName = "Fire Rune",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_scalding_rune.dds"] = {
        skillName = "Scalding Rune",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_volcanic_rune.dds"] = {
        skillName = "Volcanic Rune",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_equilibrium.dds"] = {
        skillName = "Equilibrium",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_balance.dds"] = {
        skillName = "Balance",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_spell_symmetry.dds"] = {
        skillName = "Spell Symmetry",
        position = 15,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_magesguild_ulfsilds_contingency.dds"] = {
        skillName = "Ulfsild's Contingency",
        position = 16,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },

    -- Psijic Order Skills
    ["ability_psijicorder_undo.dds"] = {
        skillName = "Undo",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_precognition.dds"] = {
        skillName = "Precognition",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_001_b.dds"] = {
        skillName = "Temporal Guard",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_time_stop.dds"] = {
        skillName = "Time Stop",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_borrowed_time.dds"] = {
        skillName = "Borrowed Time",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_time_freeze.dds"] = {
        skillName = "Time Freeze",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_imbue_weapon.dds"] = {
        skillName = "Imbue Weapon",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_crushing_weapon.dds"] = {
        skillName = "Crushing Weapon",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_elemental_weapon.dds"] = {
        skillName = "Elemental Weapon",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_accelerate.dds"] = {
        skillName = "Accelerate",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_channeled_acceleration.dds"] = {
        skillName = "Channeled Acceleration",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_race_against_time.dds"] = {
        skillName = "Race Against Time",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_mend_wounds.dds"] = {
        skillName = "Mend Wounds",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_mend_spirit.dds"] = {
        skillName = "Mend Spirit",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_symbiosis.dds"] = {
        skillName = "Symbiosis",
        position = 15,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_meditate.dds"] = {
        skillName = "Meditate",
        position = 16,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_deep_thoughts.dds"] = {
        skillName = "Deep Thoughts",
        position = 17,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijicorder_introspection.dds"] = {
        skillName = "Introspection",
        position = 18,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },

    -- Undaunted Skills
    ["ability_undaunted_blood_altar.dds"] = {
        skillName = "Blood Altar",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_overflowing_altar.dds"] = {
        skillName = "Overflowing Altar",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_sanguine_altar.dds"] = {
        skillName = "Sanguine Altar",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_trapping_webs.dds"] = {
        skillName = "Trapping Webs",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_shadow_silk.dds"] = {
        skillName = "Shadow Silk",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_tangling_webs.dds"] = {
        skillName = "Tangling Webs",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_inner_fire.dds"] = {
        skillName = "Inner Fire",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_inner_beast.dds"] = {
        skillName = "Inner Beast",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_inner_rage.dds"] = {
        skillName = "Inner Rage",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_bone_shield.dds"] = {
        skillName = "Bone Shield",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_bone_surge.dds"] = {
        skillName = "Bone Surge",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_spiked_bone_shield.dds"] = {
        skillName = "Spiked Bone Shield",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_necrotic_orb.dds"] = {
        skillName = "Necrotic Orb",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_004b.dds"] = {
        skillName = "Energy Orb",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_004_a.dds"] = {
        skillName = "Mystic Orb",
        position = 15,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },

    -- Volendrung Skills
    ["ability_volendrung_ruinous_cyclone.dds"] = {
        skillName = "Ruinous Cyclone",
        position = 1,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_volendrung_rourkens_rebuke.dds"] = {
        skillName = "Rourken's Rebuke",
        position = 2,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_volendrung_malacaths_vengeance.dds"] = {
        skillName = "Malacath's Vengeance",
        position = 3,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_volendrung_accursed_charge.dds"] = {
        skillName = "Accursed Charge",
        position = 4,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_volendrung_pariahs_resolve.dds"] = {
        skillName = "Pariah's Resolve",
        position = 5,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_volendrung_sundering_swing.dds"] = {
        skillName = "Sundering Swing",
        position = 6,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },

    -- Arcanist Skills
    ["ability_arcanist_vitalizing_glyphic.dds"] = {
        skillName = "Vitalizing Glyphic",
        position = 1,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_glyphic_of_the_tides.dds"] = {
        skillName = "Glyphic of the Tides",
        position = 2,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_resonating_glyphic.dds"] = {
        skillName = "Resonating Glyphic",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_runemend.dds"] = {
        skillName = "Runemend",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_audacious_runemend.dds"] = {
        skillName = "Audacious Runemend",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_evolving_runemend.dds"] = {
        skillName = "Evolving Runemend",
        position = 6,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_remedy_cascade.dds"] = {
        skillName = "Remedy Cascade",
        position = 7,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_cascading_fortune.dds"] = {
        skillName = "Cascading Fortune",
        position = 8,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_curative_surge.dds"] = {
        skillName = "Curative Surge",
        position = 9,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_chakram_shields.dds"] = {
        skillName = "Chakram Shields",
        position = 10,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_chakram_of_destiny.dds"] = {
        skillName = "Chakram of Destiny",
        position = 11,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_tidal_chakram.dds"] = {
        skillName = "Tidal Chakram",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_arcanists_domain.dds"] = {
        skillName = "Arcanist's Domain",
        position = 13,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_reconstructive_domain.dds"] = {
        skillName = "Reconstructive Domain",
        position = 14,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_zenas_empowering_disc.dds"] = {
        skillName = "Zenas' Empowering Disc",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_apocryphal_gate.dds"] = {
        skillName = "Apocryphal Gate",
        position = 16,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_016_a.dds"] = {
        skillName = "Fleet-Footed Gate",
        position = 17,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_passage_between_worlds.dds"] = {
        skillName = "Passage Between Worlds",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },

    -- Herald of the Tome Skills
    ["ability_arcanist_the_unblinking_eye.dds"] = {
        skillName = "The Unblinking Eye",
        position = 1,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_006_b.dds"] = {
        skillName = "The Languid Eye",
        position = 2,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_the_tide_kings_gaze.dds"] = {
        skillName = "The Tide King's Gaze",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_runeblades.dds"] = {
        skillName = "Runeblades",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_escalating_runeblades.dds"] = {
        skillName = "Escalating Runeblades",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_writhing_runeblades.dds"] = {
        skillName = "Writhing Runeblades",
        position = 6,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_002.dds"] = {
        skillName = "Fatecarver",
        position = 7,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_002_a.dds"] = {
        skillName = "Exhausting Fatecarver",
        position = 8,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_002_b.dds"] = {
        skillName = "Pragmatic Fatecarver",
        position = 9,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_abyssal_impact.dds"] = {
        skillName = "Abyssal Impact",
        position = 10,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_cephaliarchs_flail.dds"] = {
        skillName = "Cephaliarch's Flail",
        position = 11,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_tentacular_dread.dds"] = {
        skillName = "Tentacular Dread",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_tome_bearers_inspiration.dds"] = {
        skillName = "Tome-Bearer's Inspiration",
        position = 13,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_005_a.dds"] = {
        skillName = "Inspired Scholarship",
        position = 14,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_recuperative_treatise.dds"] = {
        skillName = "Recuperative Treatise",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_the_imperfect_ring.dds"] = {
        skillName = "The Imperfect Ring",
        position = 16,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_004_b.dds"] = {
        skillName = "Fulminating Rune",
        position = 17,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_rune_of_displacement.dds"] = {
        skillName = "Rune of Displacement",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },

    -- Soldier of Apocrypha Skills
    ["ability_arcanist_gibbering_shield.dds"] = {
        skillName = "Gibbering Shield",
        position = 1,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_gibbering_shelter.dds"] = {
        skillName = "Gibbering Shelter",
        position = 2,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_sanctum_of_the_abyssal_sea.dds"] = {
        skillName = "Sanctum of the Abyssal Sea",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runic_jolt.dds"] = {
        skillName = "Runic Jolt",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runic_embrace.dds"] = {
        skillName = "Runic Embrace",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runic_sunder.dds"] = {
        skillName = "Runic Sunder",
        position = 6,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runespite_ward.dds"] = {
        skillName = "Runespite Ward",
        position = 7,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_impervious_runeward.dds"] = {
        skillName = "Impervious Runeward",
        position = 8,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_spiteward_of_the_lucid_mind.dds"] = {
        skillName = "Spiteward of the Lucid Mind",
        position = 9,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_fatewoven_armor.dds"] = {
        skillName = "Fatewoven Armor",
        position = 10,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_009_a.dds"] = {
        skillName = "Cruxweaver Armor",
        position = 11,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_unbreakable_fate.dds"] = {
        skillName = "Unbreakable Fate",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runic_defense.dds"] = {
        skillName = "Runic Defense",
        position = 13,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runeguard_of_freedom.dds"] = {
        skillName = "Runeguard of Freedom",
        position = 14,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_runeguard_of_still_waters.dds"] = {
        skillName = "Runeguard of Still Waters",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_rune_of_eldritch_horror.dds"] = {
        skillName = "Rune of Eldritch Horror",
        position = 16,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_rune_of_uncanny_adoration.dds"] = {
        skillName = "Rune of Uncanny Adoration",
        position = 17,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_rune_of_the_colorless_pool.dds"] = {
        skillName = "Rune of the Colorless Pool",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },

    -- Dragonknight Skills
    ["ability_dragonknight_dragonknight_standard.dds"] = {
        skillName = "Dragonknight Standard",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_shifting_standard.dds"] = {
        skillName = "Shifting Standard",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_standard_of_might.dds"] = {
        skillName = "Standard of Might",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_lava_whip.dds"] = {
        skillName = "Lava Whip",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_flame_lash.dds"] = {
        skillName = "Flame Lash",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_molten_whip.dds"] = {
        skillName = "Molten Whip",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_searing_strike.dds"] = {
        skillName = "Searing Strike",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_burning_embers.dds"] = {
        skillName = "Burning Embers",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_venomous_claw.dds"] = {
        skillName = "Venomous Claw",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_fiery_breath.dds"] = {
        skillName = "Fiery Breath",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_engulfing_flames.dds"] = {
        skillName = "Engulfing Flames",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_noxious_breath.dds"] = {
        skillName = "Noxious Breath",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_fiery_grip.dds"] = {
        skillName = "Fiery Grip",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_chains_of_devastation.dds"] = {
        skillName = "Chains of Devastation",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_unrelenting_grip.dds"] = {
        skillName = "Unrelenting Grip",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_inferno.dds"] = {
        skillName = "Inferno",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_cauterize.dds"] = {
        skillName = "Cauterize",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_flames_of_oblivion.dds"] = {
        skillName = "Flames of Oblivion",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },

    -- Draconic Power Skills
    ["ability_dragonknight_dragon_leap.dds"] = {
        skillName = "Dragon Leap",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_ferocious_leap.dds"] = {
        skillName = "Ferocious Leap",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_take_flight.dds"] = {
        skillName = "Take Flight",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_spiked_armor.dds"] = {
        skillName = "Spiked Armor",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_hardened_armor.dds"] = {
        skillName = "Hardened Armor",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_volatile_armor.dds"] = {
        skillName = "Volatile Armor",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_dark_talons.dds"] = {
        skillName = "Dark Talons",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_burning_talons.dds"] = {
        skillName = "Burning Talons",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_choking_talons.dds"] = {
        skillName = "Choking Talons",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_dragon_blood.dds"] = {
        skillName = "Dragon Blood",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_coagulating_blood.dds"] = {
        skillName = "Coagulating Blood",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_green_dragon_blood.dds"] = {
        skillName = "Green Dragon Blood",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_protective_scale.dds"] = {
        skillName = "Protective Scale",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_dragon_fire_scale.dds"] = {
        skillName = "Dragon Fire Scale",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_protective_plate.dds"] = {
        skillName = "Protective Plate",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_inhale.dds"] = {
        skillName = "Inhale",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_deep_breath.dds"] = {
        skillName = "Deep Breath",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_draw_essence.dds"] = {
        skillName = "Draw Essence",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },

    -- Earthen Heart Skills
    ["ability_dragonknight_magma_armor.dds"] = {
        skillName = "Magma Armor",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_corrosive_armor.dds"] = {
        skillName = "Corrosive Armor",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_magma_shell.dds"] = {
        skillName = "Magma Shell",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_stonefist.dds"] = {
        skillName = "Stonefist",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_obsidian_shard.dds"] = {
        skillName = "Obsidian Shard",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_stone_giant.dds"] = {
        skillName = "Stone Giant",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_molten_weapons.dds"] = {
        skillName = "Molten Weapons",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_igneous_weapons.dds"] = {
        skillName = "Igneous Weapons",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_molten_armaments.dds"] = {
        skillName = "Molten Armaments",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_obsidian_shield.dds"] = {
        skillName = "Obsidian Shield",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_fragmented_shield.dds"] = {
        skillName = "Fragmented Shield",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_igneous_shield.dds"] = {
        skillName = "Igneous Shield",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_petrify.dds"] = {
        skillName = "Petrify",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_fossilize.dds"] = {
        skillName = "Fossilize",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_shattering_rocks.dds"] = {
        skillName = "Shattering Rocks",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_ash_cloud.dds"] = {
        skillName = "Ash Cloud",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_cinder_storm.dds"] = {
        skillName = "Cinder Storm",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_eruption.dds"] = {
        skillName = "Eruption",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },

    -- Necromancer Skills
    ["ability_necromancer_bone_goliath_transformation.dds"] = {
        skillName = "Bone Goliath Transformation",
        position = 1,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_pummeling_goliath.dds"] = {
        skillName = "Pummeling Goliath",
        position = 2,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_ravenous_goliath.dds"] = {
        skillName = "Ravenous Goliath",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_death_scythe.dds"] = {
        skillName = "Death Scythe",
        position = 4,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_007_a.dds"] = {
        skillName = "Hungry Scythe",
        position = 5,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_ruinous_scythe.dds"] = {
        skillName = "Ruinous Scythe",
        position = 6,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_bone_armor.dds"] = {
        skillName = "Bone Armor",
        position = 7,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_008_a.dds"] = {
        skillName = "Beckoning Armor",
        position = 8,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_008_b.dds"] = {
        skillName = "Summoner's Armor",
        position = 9,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_bitter_harvest.dds"] = {
        skillName = "Bitter Harvest",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_deaden_pain.dds"] = {
        skillName = "Deaden Pain",
        position = 11,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_011_b.dds"] = {
        skillName = "Necrotic Potency",
        position = 12,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_bone_totem.dds"] = {
        skillName = "Bone Totem",
        position = 13,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_agony_totem.dds"] = {
        skillName = "Agony Totem",
        position = 14,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_remote_totem.dds"] = {
        skillName = "Remote Totem",
        position = 15,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_grave_grasp.dds"] = {
        skillName = "Grave Grasp",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_empowering_grasp.dds"] = {
        skillName = "Empowering Grasp",
        position = 17,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_009_b.dds"] = {
        skillName = "Ghostly Embrace",
        position = 18,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },

    -- Grave Lord Skills
    ["ability_necromancer_frozen_colossus.dds"] = {
        skillName = "Frozen Colossus",
        position = 1,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_006_a.dds"] = {
        skillName = "Glacial Colossus",
        position = 2,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_pestilent_colossus.dds"] = {
        skillName = "Pestilent Colossus",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_flame_skull.dds"] = {
        skillName = "Flame Skull",
        position = 4,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_ricochet_skull.dds"] = {
        skillName = "Ricochet Skull",
        position = 5,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_001_a.dds"] = {
        skillName = "Venom Skull",
        position = 6,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_sacrificial_bones.dds"] = {
        skillName = "Sacrificial Bones",
        position = 7,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_002_a.dds"] = {
        skillName = "Blighted Blastbones",
        position = 8,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_grave_lords_sacrifice.dds"] = {
        skillName = "Grave Lord's Sacrifice",
        position = 9,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_boneyard.dds"] = {
        skillName = "Boneyard",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_avid_boneyard.dds"] = {
        skillName = "Avid Boneyard",
        position = 11,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_004_a.dds"] = {
        skillName = "Unnerving Boneyard",
        position = 12,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_skeletal_mage.dds"] = {
        skillName = "Skeletal Mage",
        position = 13,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_skeletal_arcanist.dds"] = {
        skillName = "Skeletal Arcanist",
        position = 14,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_skeletal_archer.dds"] = {
        skillName = "Skeletal Archer",
        position = 15,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_005_b.dds"] = {
        skillName = "Shocking Siphon",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_detonating_siphon.dds"] = {
        skillName = "Detonating Siphon",
        position = 17,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_mystic_siphon.dds"] = {
        skillName = "Mystic Siphon",
        position = 18,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },

    -- Living Death Skills
    ["ability_necromancer_reanimate.dds"] = {
        skillName = "Reanimate",
        position = 1,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_animate_blastbones.dds"] = {
        skillName = "Animate Blastbones",
        position = 2,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_renewing_animation.dds"] = {
        skillName = "Renewing Animation",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_render_flesh.dds"] = {
        skillName = "Render Flesh",
        position = 4,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_blood_sacrifice.dds"] = {
        skillName = "Blood Sacrifice",
        position = 5,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_resistant_flesh.dds"] = {
        skillName = "Resistant Flesh",
        position = 6,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_expunge.dds"] = {
        skillName = "Expunge",
        position = 7,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_expunge_and_modify.dds"] = {
        skillName = "Expunge and Modify",
        position = 8,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_hexproof.dds"] = {
        skillName = "Hexproof",
        position = 9,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_life_amid_death.dds"] = {
        skillName = "Life amid Death",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_enduring_undeath.dds"] = {
        skillName = "Enduring Undeath",
        position = 11,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_renewing_undeath.dds"] = {
        skillName = "Renewing Undeath",
        position = 12,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_spirit_mender.dds"] = {
        skillName = "Spirit Mender",
        position = 13,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_015_b.dds"] = {
        skillName = "Intensive Mender",
        position = 14,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_015_a.dds"] = {
        skillName = "Spirit Guardian",
        position = 15,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_restoring_tether.dds"] = {
        skillName = "Restoring Tether",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_braided_tether.dds"] = {
        skillName = "Braided Tether",
        position = 17,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_mortal_coil.dds"] = {
        skillName = "Mortal Coil",
        position = 18,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },

    -- Nightblade Skills
    ["ability_nightblade_death_stroke.dds"] = {
        skillName = "Death Stroke",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_incapacitating_strike.dds"] = {
        skillName = "Incapacitating Strike",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_soul_harvest.dds"] = {
        skillName = "Soul Harvest",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_veiled_strike.dds"] = {
        skillName = "Veiled Strike",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_concealed_weapon.dds"] = {
        skillName = "Concealed Weapon",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_surprise_attack.dds"] = {
        skillName = "Surprise Attack",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_teleport_strike.dds"] = {
        skillName = "Teleport Strike",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_ambush.dds"] = {
        skillName = "Ambush",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_lotus_fan.dds"] = {
        skillName = "Lotus Fan",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_assassins_blade.dds"] = {
        skillName = "Assassin's Blade",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_impale.dds"] = {
        skillName = "Impale",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_killers_blade.dds"] = {
        skillName = "Killer's Blade",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_mark_target.dds"] = {
        skillName = "Mark Target",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_piercing_mark.dds"] = {
        skillName = "Piercing Mark",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_reapers_mark.dds"] = {
        skillName = "Reaper's Mark",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_grim_focus.dds"] = {
        skillName = "Grim Focus",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_merciless_resolve.dds"] = {
        skillName = "Merciless Resolve",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_relentless_focus.dds"] = {
        skillName = "Relentless Focus",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },

    -- Shadow Skills
    ["ability_nightblade_consuming_darkness.dds"] = {
        skillName = "Consuming Darkness",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_bolstering_darkness.dds"] = {
        skillName = "Bolstering Darkness",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_veil_of_blades.dds"] = {
        skillName = "Veil of Blades",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_shadow_cloak.dds"] = {
        skillName = "Shadow Cloak",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_dark_cloak.dds"] = {
        skillName = "Dark Cloak",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_shadowy_disguise.dds"] = {
        skillName = "Shadowy Disguise",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_path_of_darkness.dds"] = {
        skillName = "Path of Darkness",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_refreshing_path.dds"] = {
        skillName = "Refreshing Path",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_twisting_path.dds"] = {
        skillName = "Twisting Path",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_blur.dds"] = {
        skillName = "Blur",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_mirage.dds"] = {
        skillName = "Mirage",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_phantasmal_escape.dds"] = {
        skillName = "Phantasmal Escape",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_aspect_of_terror.dds"] = {
        skillName = "Aspect of Terror",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_manifestation_of_terror.dds"] = {
        skillName = "Manifestation of Terror",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_mass_hysteria.dds"] = {
        skillName = "Mass Hysteria",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_summon_shade.dds"] = {
        skillName = "Summon Shade",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_dark_shade.dds"] = {
        skillName = "Dark Shade",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_shadow_image.dds"] = {
        skillName = "Shadow Image",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },

    -- Siphoning Skills
    ["ability_nightblade_soul_shred.dds"] = {
        skillName = "Soul Shred",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_soul_siphon.dds"] = {
        skillName = "Soul Siphon",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_soul_tether.dds"] = {
        skillName = "Soul Tether",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_strife.dds"] = {
        skillName = "Strife",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_funnel_health.dds"] = {
        skillName = "Funnel Health",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_swallow_soul.dds"] = {
        skillName = "Swallow Soul",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_malevolent_offering.dds"] = {
        skillName = "Malevolent Offering",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_healthy_offering.dds"] = {
        skillName = "Healthy Offering",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_shrewd_offering.dds"] = {
        skillName = "Shrewd Offering",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_cripple.dds"] = {
        skillName = "Cripple",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_crippling_grasp.dds"] = {
        skillName = "Crippling Grasp",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_debilitate.dds"] = {
        skillName = "Debilitate",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_siphoning_strikes.dds"] = {
        skillName = "Siphoning Strikes",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_leeching_strikes.dds"] = {
        skillName = "Leeching Strikes",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_siphoning_attacks.dds"] = {
        skillName = "Siphoning Attacks",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_drain_power.dds"] = {
        skillName = "Drain Power",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_power_extraction.dds"] = {
        skillName = "Power Extraction",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_sap_essence.dds"] = {
        skillName = "Sap Essence",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },

    -- Sorcerer Skills
    ["ability_sorcerer_summon_storm_atronach.dds"] = {
        skillName = "Summon Storm Atronach",
        position = 1,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_greater_storm_atronach.dds"] = {
        skillName = "Greater Storm Atronach",
        position = 2,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_charged_atronach.dds"] = {
        skillName = "Summon Charged Atronach",
        position = 3,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_unstable_familiar.dds"] = {
        skillName = "Summon Unstable Familiar",
        position = 4,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_unstable_clannfear.dds"] = {
        skillName = "Summon Unstable Clannfear",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_volatile_familiar.dds"] = {
        skillName = "Summon Volatile Familiar",
        position = 6,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_daedric_curse.dds"] = {
        skillName = "Daedric Curse",
        position = 7,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_daedric_prey.dds"] = {
        skillName = "Daedric Prey",
        position = 8,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_haunting_curse.dds"] = {
        skillName = "Haunting Curse",
        position = 9,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_winged_twilight.dds"] = {
        skillName = "Summon Winged Twilight",
        position = 10,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_twilight_matriarch.dds"] = {
        skillName = "Summon Twilight Matriarch",
        position = 11,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_summon_twilight_tormentor.dds"] = {
        skillName = "Summon Twilight Tormentor",
        position = 12,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_conjured_ward.dds"] = {
        skillName = "Conjured Ward",
        position = 13,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_hardened_ward.dds"] = {
        skillName = "Hardened Ward",
        position = 14,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_regenerative_ward.dds"] = {
        skillName = "Regenerative Ward",
        position = 15,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_armor.dds"] = {
        skillName = "Bound Armor",
        position = 16,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_aegis.dds"] = {
        skillName = "Bound Aegis",
        position = 17,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_armaments.dds"] = {
        skillName = "Bound Armaments",
        position = 18,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },

    -- Dark Magic Skills
    ["ability_sorcerer_negate_magic.dds"] = {
        skillName = "Negate Magic",
        position = 1,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_absorption_field.dds"] = {
        skillName = "Absorption Field",
        position = 2,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_suppression_field.dds"] = {
        skillName = "Suppression Field",
        position = 3,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crystal_shard.dds"] = {
        skillName = "Crystal Shard",
        position = 4,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crystal_fragments.dds"] = {
        skillName = "Crystal Fragments",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crystal_weapon.dds"] = {
        skillName = "Crystal Weapon",
        position = 6,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_encase.dds"] = {
        skillName = "Encase",
        position = 7,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_shattering_spines.dds"] = {
        skillName = "Shattering Spines",
        position = 8,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_vibrant_shroud.dds"] = {
        skillName = "Vibrant Shroud",
        position = 9,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_rune_prison.dds"] = {
        skillName = "Rune Prison",
        position = 10,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_defensive_rune.dds"] = {
        skillName = "Defensive Rune",
        position = 11,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_rune_cage.dds"] = {
        skillName = "Rune Cage",
        position = 12,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_dark_exchange.dds"] = {
        skillName = "Dark Exchange",
        position = 13,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_dark_conversion.dds"] = {
        skillName = "Dark Conversion",
        position = 14,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_dark_deal.dds"] = {
        skillName = "Dark Deal",
        position = 15,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_daedric_mines.dds"] = {
        skillName = "Daedric Mines",
        position = 16,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_daedric_refuge.dds"] = {
        skillName = "Daedric Refuge",
        position = 17,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_daedric_tomb.dds"] = {
        skillName = "Daedric Tomb",
        position = 18,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },

    -- Storm Calling Skills
    ["ability_sorcerer_overload.dds"] = {
        skillName = "Overload",
        position = 1,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_energy_overload.dds"] = {
        skillName = "Energy Overload",
        position = 2,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_power_overload.dds"] = {
        skillName = "Power Overload",
        position = 3,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_mages_fury.dds"] = {
        skillName = "Mages' Fury",
        position = 4,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_endless_fury.dds"] = {
        skillName = "Endless Fury",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_mages_wrath.dds"] = {
        skillName = "Mages' Wrath",
        position = 6,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_lightning_form.dds"] = {
        skillName = "Lightning Form",
        position = 7,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_boundless_storm.dds"] = {
        skillName = "Boundless Storm",
        position = 8,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_hurricane.dds"] = {
        skillName = "Hurricane",
        position = 9,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_lightning_splash.dds"] = {
        skillName = "Lightning Splash",
        position = 10,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_lightning_flood.dds"] = {
        skillName = "Lightning Flood",
        position = 11,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_liquid_lightning.dds"] = {
        skillName = "Liquid Lightning",
        position = 12,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_surge.dds"] = {
        skillName = "Surge",
        position = 13,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_critical_surge.dds"] = {
        skillName = "Critical Surge",
        position = 14,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_power_surge.dds"] = {
        skillName = "Power Surge",
        position = 15,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_bolt_escape.dds"] = {
        skillName = "Bolt Escape",
        position = 16,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_ball_of_lightning.dds"] = {
        skillName = "Ball of Lightning",
        position = 17,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },
    ["ability_sorcerer_streak.dds"] = {
        skillName = "Streak",
        position = 18,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Storm Calling"
    },

    -- Templar Skills
    ["ability_templar_radial_sweep.dds"] = {
        skillName = "Radial Sweep",
        position = 1,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_crescent_sweep.dds"] = {
        skillName = "Crescent Sweep",
        position = 2,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_everlasting_sweep.dds"] = {
        skillName = "Everlasting Sweep",
        position = 3,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_puncturing_strikes.dds"] = {
        skillName = "Puncturing Strikes",
        position = 4,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_biting_jabs.dds"] = {
        skillName = "Biting Jabs",
        position = 5,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_reckless_attacks.dds"] = {
        skillName = "Puncturing Sweep",
        position = 6,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_piercing_javelin.dds"] = {
        skillName = "Piercing Javelin",
        position = 7,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_aurora_javelin.dds"] = {
        skillName = "Aurora Javelin",
        position = 8,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_binding_javelin.dds"] = {
        skillName = "Binding Javelin",
        position = 9,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_focused_charge.dds"] = {
        skillName = "Focused Charge",
        position = 10,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_explosive_charge.dds"] = {
        skillName = "Explosive Charge",
        position = 11,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_toppling_charge.dds"] = {
        skillName = "Toppling Charge",
        position = 12,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_spear_shards.dds"] = {
        skillName = "Spear Shards",
        position = 13,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templarsun_thrust.dds"] = {
        skillName = "Blazing Spear",
        position = 14,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_luminous_shards.dds"] = {
        skillName = "Luminous Shards",
        position = 15,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_sun_shield.dds"] = {
        skillName = "Sun Shield",
        position = 16,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_blazing_shield.dds"] = {
        skillName = "Blazing Shield",
        position = 17,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_radiant_ward.dds"] = {
        skillName = "Radiant Ward",
        position = 18,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },

    -- Dawn's Wrath Skills
    ["ability_templar_nova.dds"] = {
        skillName = "Nova",
        position = 1,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_solar_disturbance.dds"] = {
        skillName = "Solar Disturbance",
        position = 2,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_solar_prison.dds"] = {
        skillName = "Solar Prison",
        position = 3,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_sun_fire.dds"] = {
        skillName = "Sun Fire",
        position = 4,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_reflective_light.dds"] = {
        skillName = "Reflective Light",
        position = 5,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_vampire_bane.dds"] = {
        skillName = "Vampire's Bane",
        position = 6,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_solar_flare.dds"] = {
        skillName = "Solar Flare",
        position = 7,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_dark_flare.dds"] = {
        skillName = "Dark Flare",
        position = 8,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_solar_power.dds"] = {
        skillName = "Solar Barrage",
        position = 9,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_backlash.dds"] = {
        skillName = "Backlash",
        position = 10,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_power_of_the_light.dds"] = {
        skillName = "Power of the Light",
        position = 11,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_purifying_light.dds"] = {
        skillName = "Purifying Light",
        position = 12,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_eclipse.dds"] = {
        skillName = "Eclipse",
        position = 13,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_living_dark.dds"] = {
        skillName = "Living Dark",
        position = 14,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_unstable_core.dds"] = {
        skillName = "Unstable Core",
        position = 15,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_radiant_destruction.dds"] = {
        skillName = "Radiant Destruction",
        position = 16,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_under_exposure.dds"] = {
        skillName = "Radiant Glory",
        position = 17,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_radiant_oppression.dds"] = {
        skillName = "Radiant Oppression",
        position = 18,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },

    -- Restoring Light Skills
    ["ability_templar_rite_of_passage.dds"] = {
        skillName = "Rite of Passage",
        position = 1,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_practiced_incantation.dds"] = {
        skillName = "Practiced Incantation",
        position = 2,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_remembrance.dds"] = {
        skillName = "Remembrance",
        position = 3,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_rushed_ceremony.dds"] = {
        skillName = "Rushed Ceremony",
        position = 4,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_breath_of_life.dds"] = {
        skillName = "Breath of Life",
        position = 5,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_honor_the_dead.dds"] = {
        skillName = "Honor the Dead",
        position = 6,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_healing_ritual.dds"] = {
        skillName = "Healing Ritual",
        position = 7,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_hasty_prayer.dds"] = {
        skillName = "Hasty Prayer",
        position = 8,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_ritual_of_rebirth.dds"] = {
        skillName = "Ritual of Rebirth",
        position = 9,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_restoring_aura.dds"] = {
        skillName = "Restoring Aura",
        position = 10,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_radiant_aura.dds"] = {
        skillName = "Radiant Aura",
        position = 11,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_persistant_sigil.dds"] = {
        skillName = "Repentance",
        position = 12,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_cleansing_ritual.dds"] = {
        skillName = "Cleansing Ritual",
        position = 13,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_extended_ritual.dds"] = {
        skillName = "Extended Ritual",
        position = 14,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_ritual_of_retribution.dds"] = {
        skillName = "Ritual of Retribution",
        position = 15,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_rune_focus.dds"] = {
        skillName = "Rune Focus",
        position = 16,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_channeled_focus.dds"] = {
        skillName = "Channeled Focus",
        position = 17,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_restoring_focus.dds"] = {
        skillName = "Restoring Focus",
        position = 18,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },

    -- Warden Skills
    ["ability_warden_feral_guardian.dds"] = {
        skillName = "Feral Guardian",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_eternal_guardian.dds"] = {
        skillName = "Eternal Guardian",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_wild_guardian.dds"] = {
        skillName = "Wild Guardian",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_dive.dds"] = {
        skillName = "Dive",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_cutting_dive.dds"] = {
        skillName = "Cutting Dive",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_screaming_cliff_racer.dds"] = {
        skillName = "Screaming Cliff Racer",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_scorch.dds"] = {
        skillName = "Scorch",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_deep_fissure.dds"] = {
        skillName = "Deep Fissure",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_subterranean_assault.dds"] = {
        skillName = "Subterranean Assault",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_swarm.dds"] = {
        skillName = "Swarm",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_fetcher_infection.dds"] = {
        skillName = "Fetcher Infection",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_growing_swarm.dds"] = {
        skillName = "Growing Swarm",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_betty_netch.dds"] = {
        skillName = "Betty Netch",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_blue_betty.dds"] = {
        skillName = "Blue Betty",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_bull_netch.dds"] = {
        skillName = "Bull Netch",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_falcons_swiftness.dds"] = {
        skillName = "Falcon's Swiftness",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_bird_of_prey.dds"] = {
        skillName = "Bird of Prey",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_deceptive_predator.dds"] = {
        skillName = "Deceptive Predator",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },

    -- Green Balance Skills
    ["ability_warden_secluded_grove.dds"] = {
        skillName = "Secluded Grove",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_enchanted_forest.dds"] = {
        skillName = "Enchanted Forest",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_healing_thicket.dds"] = {
        skillName = "Healing Thicket",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_fungal_growth.dds"] = {
        skillName = "Fungal Growth",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_enchanted_growth.dds"] = {
        skillName = "Enchanted Growth",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_soothing_spores.dds"] = {
        skillName = "Soothing Spores",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_healing_seed.dds"] = {
        skillName = "Healing Seed",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_budding_seeds.dds"] = {
        skillName = "Budding Seeds",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_corrupting_pollen.dds"] = {
        skillName = "Corrupting Pollen",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_living_vines.dds"] = {
        skillName = "Living Vines",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_leeching_vines.dds"] = {
        skillName = "Leeching Vines",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_living_trellis.dds"] = {
        skillName = "Living Trellis",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_lotus_flower.dds"] = {
        skillName = "Lotus Flower",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_green_lotus.dds"] = {
        skillName = "Green Lotus",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_lotus_blossom.dds"] = {
        skillName = "Lotus Blossom",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_natures_grasp.dds"] = {
        skillName = "Nature's Grasp",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_bursting_vines.dds"] = {
        skillName = "Bursting Vines",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_natures_embrace.dds"] = {
        skillName = "Nature's Embrace",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },

    -- Winter's Embrace Skills
    ["ability_warden_sleet_storm.dds"] = {
        skillName = "Sleet Storm",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_northern_storm.dds"] = {
        skillName = "Northern Storm",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_permafrost.dds"] = {
        skillName = "Permafrost",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_frost_cloak.dds"] = {
        skillName = "Frost Cloak",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_expansive_frost_cloak.dds"] = {
        skillName = "Expansive Frost Cloak",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_ice_fortress.dds"] = {
        skillName = "Ice Fortress",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_impaling_shards.dds"] = {
        skillName = "Impaling Shards",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_gripping_shards.dds"] = {
        skillName = "Gripping Shards",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_winters_revenge.dds"] = {
        skillName = "Winter's Revenge",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_arctic_wind.dds"] = {
        skillName = "Arctic Wind",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_arctic_blast.dds"] = {
        skillName = "Arctic Blast",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_polar_wind.dds"] = {
        skillName = "Polar Wind",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_crystallized_shield.dds"] = {
        skillName = "Crystallized Shield",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_crystallized_slab.dds"] = {
        skillName = "Crystallized Slab",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_shimmering_shield.dds"] = {
        skillName = "Shimmering Shield",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_frozen_gate.dds"] = {
        skillName = "Frozen Gate",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_frozen_device.dds"] = {
        skillName = "Frozen Device",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_frozen_retreat.dds"] = {
        skillName = "Frozen Retreat",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },

    -- World Skills
    ["ability_world_soul_strike.dds"] = {
        skillName = "Soul Strike",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_shatter_soul.dds"] = {
        skillName = "Shatter Soul",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_soul_assault.dds"] = {
        skillName = "Soul Assault",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_soul_trap.dds"] = {
        skillName = "Soul Trap",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_consuming_trap.dds"] = {
        skillName = "Consuming Trap",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_soul_splitting_trap.dds"] = {
        skillName = "Soul Splitting Trap",
        position = 6,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_soul_burst.dds"] = {
        skillName = "Soul Burst",
        position = 7,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_world_wield_soul.dds"] = {
        skillName = "Wield Soul",
        position = 8,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },

    -- Vampire Skills
    ["ability_world_blood_scion.dds"] = {
        skillName = "Blood Scion",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_perfect_scion.dds"] = {
        skillName = "Perfect Scion",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_swarming_scion.dds"] = {
        skillName = "Swarming Scion",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_eviscerate.dds"] = {
        skillName = "Eviscerate",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_arterial_burst.dds"] = {
        skillName = "Arterial Burst",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_blood_for_blood.dds"] = {
        skillName = "Blood for Blood",
        position = 6,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_blood_frenzy.dds"] = {
        skillName = "Blood Frenzy",
        position = 7,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_sated_fury.dds"] = {
        skillName = "Sated Fury",
        position = 8,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_simmering_frenzy.dds"] = {
        skillName = "Simmering Frenzy",
        position = 9,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_vampiric_drain.dds"] = {
        skillName = "Vampiric Drain",
        position = 10,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_drain_vigor.dds"] = {
        skillName = "Drain Vigor",
        position = 11,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_03_b.dds"] = {
        skillName = "Exhilarating Drain",
        position = 12,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_mesmerize.dds"] = {
        skillName = "Mesmerize",
        position = 13,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_hypnosis.dds"] = {
        skillName = "Hypnosis",
        position = 14,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_stupefy.dds"] = {
        skillName = "Stupefy",
        position = 15,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_mist_form.dds"] = {
        skillName = "Mist Form",
        position = 16,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_blood_mist.dds"] = {
        skillName = "Blood Mist",
        position = 17,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_world_elusive_mist.dds"] = {
        skillName = "Elusive Mist",
        position = 18,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },

    -- Werewolf Skills
    ["ability_world_werewolf_transformation.dds"] = {
        skillName = "Werewolf Transformation",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_pack_leader.dds"] = {
        skillName = "Pack Leader",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_werewolf_berserker.dds"] = {
        skillName = "Werewolf Berserker",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_pounce.dds"] = {
        skillName = "Pounce",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_brutal_pounce.dds"] = {
        skillName = "Brutal Pounce",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_feral_pounce.dds"] = {
        skillName = "Feral Pounce",
        position = 6,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_hircines_bounty.dds"] = {
        skillName = "Hircine's Bounty",
        position = 7,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_hircines_fortitude.dds"] = {
        skillName = "Hircine's Fortitude",
        position = 8,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_hircines_rage.dds"] = {
        skillName = "Hircine's Rage",
        position = 9,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_roar.dds"] = {
        skillName = "Roar",
        position = 10,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_deafening_roar.dds"] = {
        skillName = "Deafening Roar",
        position = 11,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_ferocious_roar.dds"] = {
        skillName = "Ferocious Roar",
        position = 12,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_piercing_howl.dds"] = {
        skillName = "Piercing Howl",
        position = 13,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_howl_of_agony.dds"] = {
        skillName = "Howl of Agony",
        position = 14,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_howl_of_despair.dds"] = {
        skillName = "Howl of Despair",
        position = 15,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_infectious_claws.dds"] = {
        skillName = "Infectious Claws",
        position = 16,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_claws_of_anguish.dds"] = {
        skillName = "Claws of Anguish",
        position = 17,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_world_claws_of_life.dds"] = {
        skillName = "Claws of Life",
        position = 18,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
}

function AbilityIconsFramework.GenerateScribedSkillsIcons()

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.BANNER_BEARER] = {
        [EFFECT.FLAME] = addonIcon("ability_grimoire_support_flame.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_support_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_support_magic.dds"),
        [EFFECT.RESOURCES] = addonIcon("ability_grimoire_support_resources.dds"),
        [EFFECT.MULTITARGET] = addonIcon("ability_grimoire_support_magic.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_support_physical.dds"),
		[EFFECT.PHYSICAL] = DEFAULT_ICONS.BANNER_BEARER,
		[EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_support_immobilize.dds"),
	
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.ELEMENTAL_EXPLOSION] = {
        [EFFECT.FLAME] = DEFAULT_ICONS.ELEMENTAL_EXPLOSION,
        [EFFECT.FROST] = addonIcon("ability_grimoire_staffdestro_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_staffdestro_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_staffdestro_magic.dds"),
        [EFFECT.DISPEL] = addonIcon("ability_grimoire_staffdestro_magic.dds"),
        [EFFECT.TRAUMA] = addonIcon("ability_grimoire_staffdestro_trauma.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_staffdestro_physical.dds")
    }
    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.MENDERS_BOND] = {
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_staffresto_magic.dds"),
        [EFFECT.RESOURCES] = addonIcon("ability_grimoire_staffresto_resources.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_staffresto_shield.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.MENDERS_BOND
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SHIELD_THROW] = {
        [EFFECT.FROST] = addonIcon("ability_grimoire_1handed_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_1handed_magic.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_1handed_magic.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.SHIELD_THROW
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SMASH] = {
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_2handed_magic.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_2handed_heal.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_2handed_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_2handed_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_2handed_poison.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.SMASH
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SOUL_BURST] = {
        [EFFECT.FLAME] = addonIcon("ability_grimoire_soulmagic2_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_soulmagic2_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_soulmagic2_shock.dds"),
        [EFFECT.MAGIC] = DEFAULT_ICONS.SOUL_BURST,
        [EFFECT.HEAL] = addonIcon("ability_grimoire_soulmagic2_heal.dds"),
        [EFFECT.IMMOBILIZE] = DEFAULT_ICONS.SOUL_BURST,
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_soulmagic2_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_soulmagic2_bleed.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_soulmagic2_disease.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_soulmagic2_physical.dds")
    }
    
    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TORCHBEARER] = {
        [EFFECT.FLAME] = DEFAULT_ICONS.TORCHBEARER,
        [EFFECT.FROST] = addonIcon("ability_grimoire_fightersguild_frost.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_fightersguild_heal.dds"),
        [EFFECT.ULTIMATE] = addonIcon("ability_grimoire_fightersguild_ultimate.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_fightersguild_bleed.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_fightersguild_physical.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TRAMPLE] = {
        [EFFECT.FROST] = addonIcon("ability_grimoire_assault_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_assault_magic.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_assault_stun.dds"),
        [EFFECT.DISPEL] = addonIcon("ability_grimoire_assault_magic.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_assault_physical.dds"),
        [EFFECT.TRAUMA] = addonIcon("ability_grimoire_assault_trauma.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_assault_disease.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.TRAMPLE
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TRAVELING_KNIFE] = {
        [EFFECT.FROST] = addonIcon("ability_grimoire_dualwield_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_dualwield_magic.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_dualwield_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_dualwield_poison.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.TRAVELING_KNIFE
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.ULFSILDS_CONTINGENCY] = {
        [EFFECT.FLAME] = addonIcon("ability_grimoire_magesguild_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_magesguild_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_magesguild_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_magesguild_magic.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_magesguild_bleed.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_magesguild_heal.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.VAULT] = {
        [EFFECT.FLAME] = addonIcon("ability_grimoire_bow_flame.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_bow_heal.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_bow_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_bow_poison.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_bow_poison.dds"),
        [EFFECT.DEFAULT] = DEFAULT_ICONS.VAULT
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.WIELD_SOUL] = {
        [EFFECT.FLAME] = addonIcon("ability_grimoire_soulmagic1_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_soulmagic1_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_soulmagic1_shock.dds"),
        [EFFECT.MAGIC] = DEFAULT_ICONS.WIELD_SOUL,
        [EFFECT.HEAL] = addonIcon("ability_grimoire_soulmagic1_heal.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_soulmagic1_frost.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_soulmagic1_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_soulmagic1_bleed.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_soulmagic1_disease.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_soulmagic1_physical.dds")
    }
end

-- Base game icon replacements
local REPLACEMENT_ICONS = {
    -- Dragonknight
"ability_dragonknight_001.dds",
"ability_dragonknight_001_a.dds",
"ability_dragonknight_001_b.dds",
"ability_dragonknight_002.dds",
"ability_dragonknight_002_a.dds",
"ability_dragonknight_002_b.dds",
"ability_dragonknight_003.dds",
"ability_dragonknight_003_a.dds",
"ability_dragonknight_003_b.dds",
"ability_dragonknight_004.dds",
"ability_dragonknight_004_a.dds",
"ability_dragonknight_004_b.dds",
"ability_dragonknight_005.dds",
"ability_dragonknight_005_a.dds",
"ability_dragonknight_005_b.dds",
"ability_dragonknight_006.dds",
"ability_dragonknight_006_a.dds",
"ability_dragonknight_006_b.dds",
"ability_dragonknight_007.dds",
"ability_dragonknight_007_a.dds",
"ability_dragonknight_007_b.dds",
"ability_dragonknight_008.dds",
"ability_dragonknight_008_a.dds",
"ability_dragonknight_008_b.dds",
"ability_dragonknight_009.dds",
"ability_dragonknight_009_a.dds",
"ability_dragonknight_009_b.dds",
"ability_dragonknight_010.dds",
"ability_dragonknight_010_a.dds",
"ability_dragonknight_010_b.dds",
"ability_dragonknight_011.dds",
"ability_dragonknight_011_a.dds",
"ability_dragonknight_011_b.dds",
"ability_dragonknight_012.dds",
"ability_dragonknight_012_a.dds",
"ability_dragonknight_012_b.dds",
"ability_dragonknight_013.dds",
"ability_dragonknight_013_a.dds",
"ability_dragonknight_013_b.dds",
"ability_dragonknight_014.dds",
"ability_dragonknight_014_a.dds",
"ability_dragonknight_014b.dds",
"ability_dragonknight_015.dds",
"ability_dragonknight_015_a.dds",
"ability_dragonknight_015_b.dds",
"ability_dragonknight_016.dds",
"ability_dragonknight_016a.dds",
"ability_dragonknight_016b.dds",
"ability_dragonknight_017.dds",
"ability_dragonknight_017a.dds",
"ability_dragonknight_017b.dds",
"ability_dragonknight_018.dds",
"ability_dragonknight_018_a.dds",
"ability_dragonknight_018_b.dds",
	
	-- Sorcerer
"ability_sorcerer_ball_of_lightning.dds",
"ability_sorcerer_bolt_escape.dds",
"ability_sorcerer_bound_aegis.dds",
"ability_sorcerer_bound_armaments.dds",
"ability_sorcerer_bound_armor.dds",
"ability_sorcerer_boundless_storm.dds",
"ability_sorcerer_critical_surge.dds",
"ability_sorcerer_crushing_monsoon.dds",
"ability_sorcerer_crushing_winds.dds",
"ability_sorcerer_crystalweapon.dds",
"ability_sorcerer_cyclone.dds",
"ability_sorcerer_daedric_curse.dds",
"ability_sorcerer_daedric_minefield.dds",
"ability_sorcerer_daedric_mines.dds",
"ability_sorcerer_daedric_tomb.dds",
"ability_sorcerer_dark_conversion.dds",
"ability_sorcerer_dark_deal.dds",
"ability_sorcerer_dark_exchange.dds",
"ability_sorcerer_dark_fog.dds",
"ability_sorcerer_dark_haze.dds",
"ability_sorcerer_endless_atronachs.dds",
"ability_sorcerer_endless_fury.dds",
"ability_sorcerer_energy_overload.dds",
"ability_sorcerer_explosive_curse.dds",
"ability_sorcerer_greater_storm_atronach.dds",
"ability_sorcerer_hurricane.dds",
"ability_sorcerer_lightning_flood.dds",
"ability_sorcerer_lightning_form.dds",
"ability_sorcerer_lightning_matriarch.dds",
"ability_sorcerer_lightning_prey.dds",
"ability_sorcerer_lightning_splash.dds",
"ability_sorcerer_liquid_lightning.dds",
"ability_sorcerer_mage_fury.dds",
"ability_sorcerer_mage_wraith.dds",
"ability_sorcerer_monsoon.dds",
"ability_sorcerer_overload.dds",
"ability_sorcerer_power_overload.dds",
"ability_sorcerer_power_surge.dds",
"ability_sorcerer_rushing_winds.dds",
"ability_sorcerer_speedy_familiar.dds",
"ability_sorcerer_storm_atronach.dds",
"ability_sorcerer_storm_prey.dds",
"ability_sorcerer_streak.dds",
"ability_sorcerer_surge.dds",
"ability_sorcerer_tempest.dds",
"ability_sorcerer_thunderclap.dds",
"ability_sorcerer_thundering_presence.dds",
"ability_sorcerer_thunderstomp.dds",
"ability_sorcerer_twister.dds",
"ability_sorcerer_typhoon.dds",
"ability_sorcerer_unstable_clannfear.dds",
"ability_sorcerer_unstable_fimiliar.dds",
"ability_sorcerer_velocious_curse.dds",
"ability_sorcerer_weakening_fog.dds",

	-- Nightblade
"ability_necromancer_018_b.dds",
"ability_nightblade_001.dds",
"ability_nightblade_001_a.dds",
"ability_nightblade_001_b.dds",
"ability_nightblade_002.dds",
"ability_nightblade_002_a.dds",
"ability_nightblade_002_b.dds",
"ability_nightblade_003.dds",
"ability_nightblade_003_a.dds",
"ability_nightblade_003_b.dds",
"ability_nightblade_004.dds",
"ability_nightblade_004_a.dds",
"ability_nightblade_004_b.dds",
"ability_nightblade_005.dds",
"ability_nightblade_005_a.dds",
"ability_nightblade_005_b.dds",
"ability_nightblade_006.dds",
"ability_nightblade_006_a.dds",
"ability_nightblade_006_b.dds",
"ability_nightblade_007.dds",
"ability_nightblade_007_a.dds",
"ability_nightblade_007_b.dds",
"ability_nightblade_008.dds",
"ability_nightblade_008_a.dds",
"ability_nightblade_008_b.dds",
"ability_nightblade_009.dds",
"ability_nightblade_009_a.dds",
"ability_nightblade_009_b.dds",
"ability_nightblade_010.dds",
"ability_nightblade_010_a.dds",
"ability_nightblade_010_b.dds",
"ability_nightblade_011.dds",
"ability_nightblade_011_a.dds",
"ability_nightblade_011_b.dds",
"ability_nightblade_012.dds",
"ability_nightblade_012_a.dds",
"ability_nightblade_012_b.dds",
"ability_nightblade_013.dds",
"ability_nightblade_013_a.dds",
"ability_nightblade_013_b.dds",
"ability_nightblade_014.dds",
"ability_nightblade_014_a.dds",
"ability_nightblade_014_b.dds",
"ability_nightblade_015.dds",
"ability_nightblade_015_a.dds",
"ability_nightblade_015_b.dds",
"ability_nightblade_016.dds",
"ability_nightblade_016_a.dds",
"ability_nightblade_016_b.dds",
"ability_nightblade_017.dds",
"ability_nightblade_017_a.dds",
"ability_nightblade_017_b.dds",
"ability_nightblade_018.dds",
"ability_nightblade_018_a.dds",
"ability_nightblade_018_b.dds",	

	-- Templar
"ability_templar_backlash.dds",
"ability_templar_blazing_shield.dds",
"ability_templar_breath_of_life.dds",
"ability_templar_channeled_focus.dds",
"ability_templar_cleansing_ritual.dds",
"ability_templar_crescent_sweep.dds",
"ability_templar_dark_flare.dds",
"ability_templar_double_tipped_charge.dds",
"ability_templar_eclipse.dds",
"ability_templar_empowering_sweep.dds",
"ability_templar_extended_ritual.dds",
"ability_templar_focused_charge.dds",
"ability_templar_healing_ritual.dds",
"ability_templar_honor_the_dead.dds",
"ability_templar_life_giving_sigil.dds",
"ability_templar_light_spear.dds",
"ability_templar_light_strike.dds",
"ability_templar_lingering_ritual.dds",
"ability_templar_nova.dds",
"ability_templar_over_exposure.dds",
"ability_templar_persistant_sigil.dds",
"ability_templar_power_of_the_light.dds",
"ability_templar_practiced_incantation.dds",
"ability_templar_purifying_light.dds",
"ability_templar_purifying_ritual.dds",
"ability_templar_radial_sweep.dds",
"ability_templar_radiant_ward.dds",
"ability_templar_reckless_attacks.dds",
"ability_templar_recovery.dds",
"ability_templar_reflective_light.dds",
"ability_templar_remembrance.dds",
"ability_templar_restoring_sigil.dds",
"ability_templar_returning_spear.dds",
"ability_templar_ripping_spear.dds",
"ability_templar_rite_of_passage.dds",
"ability_templar_ritual_of_rebirth.dds",
"ability_templar_rune_focus.dds",
"ability_templar_rushed_ceremony.dds",
"ability_templar_solar_disturbance.dds",
"ability_templar_solar_flare.dds",
"ability_templar_solar_power.dds",
"ability_templar_solar_prison.dds",
"ability_templar_stendarr_aura.dds",
"ability_templar_sun_fire.dds",
"ability_templar_sun_shield.dds",
"ability_templar_sun_strike.dds",
"ability_templar_toppling_charge.dds",
"ability_templar_total_dark.dds",
"ability_templar_trained_attacker.dds",
"ability_templar_under_exposure.dds",
"ability_templar_uninterrupted_focus.dds",
"ability_templar_unstable_core.dds",
"ability_templar_vampire_bane.dds",
"ability_templarsun_thrust.dds",

	
	-- Warden
"ability_warden_001.dds",
"ability_warden_001_a.dds",
"ability_warden_001_b.dds",
"ability_warden_002.dds",
"ability_warden_002_a.dds",
"ability_warden_002_b.dds",
"ability_warden_003.dds",
"ability_warden_003_a.dds",
"ability_warden_003_b.dds",
"ability_warden_004.dds",
"ability_warden_004_a.dds",
"ability_warden_004_b.dds",
"ability_warden_005.dds",
"ability_warden_005_a.dds",
"ability_warden_005_b.dds",
"ability_warden_006.dds",
"ability_warden_006_a.dds",
"ability_warden_006_b.dds",
"ability_warden_007.dds",
"ability_warden_007_b.dds",
"ability_warden_007_c.dds",
"ability_warden_008.dds",
"ability_warden_008_a.dds",
"ability_warden_008_b.dds",
"ability_warden_009.dds",
"ability_warden_009_a.dds",
"ability_warden_009_b.dds",
"ability_warden_010.dds",
"ability_warden_010_a.dds",
"ability_warden_010_b.dds",
"ability_warden_011.dds",
"ability_warden_011_a.dds",
"ability_warden_011_b.dds",
"ability_warden_012.dds",
"ability_warden_012_a.dds",
"ability_warden_012_b.dds",
"ability_warden_013.dds",
"ability_warden_013_a.dds",
"ability_warden_013_b.dds",
"ability_warden_014.dds",
"ability_warden_014_a.dds",
"ability_warden_014_b.dds",
"ability_warden_015.dds",
"ability_warden_015_a.dds",
"ability_warden_015_b.dds",
"ability_warden_016.dds",
"ability_warden_016_a.dds",
"ability_warden_016_b.dds",
"ability_warden_017.dds",
"ability_warden_017_a.dds",
"ability_warden_017_b.dds",
"ability_warden_018.dds",
"ability_warden_018_b.dds",
"ability_warden_018_c.dds",

	-- Necromancer
"ability_necromancer_001.dds",
"ability_necromancer_001_a.dds",
"ability_necromancer_001_b.dds",
"ability_necromancer_002.dds",
"ability_necromancer_002_a.dds",
"ability_necromancer_002_b.dds",
"ability_necromancer_003.dds",
"ability_necromancer_003_a.dds",
"ability_necromancer_003_b.dds",
"ability_necromancer_004.dds",
"ability_necromancer_004_a.dds",
"ability_necromancer_004_b.dds",
"ability_necromancer_005.dds",
"ability_necromancer_005_a.dds",
"ability_necromancer_005_b.dds",
"ability_necromancer_006.dds",
"ability_necromancer_006_a.dds",
"ability_necromancer_006_b.dds",
"ability_necromancer_007.dds",
"ability_necromancer_007_a.dds",
"ability_necromancer_007_b.dds",
"ability_necromancer_008.dds",
"ability_necromancer_008_a.dds",
"ability_necromancer_008_b.dds",
"ability_necromancer_009.dds",
"ability_necromancer_009_a.dds",
"ability_necromancer_009_b.dds",
"ability_necromancer_010.dds",
"ability_necromancer_010_a.dds",
"ability_necromancer_010_b.dds",
"ability_necromancer_011.dds",
"ability_necromancer_011_a.dds",
"ability_necromancer_011_b.dds",
"ability_necromancer_012.dds",
"ability_necromancer_012_a.dds",
"ability_necromancer_012_b.dds",
"ability_necromancer_013.dds",
"ability_necromancer_013_a.dds",
"ability_necromancer_013_b.dds",
"ability_necromancer_014.dds",
"ability_necromancer_014_a.dds",
"ability_necromancer_014_b.dds",
"ability_necromancer_015.dds",
"ability_necromancer_015_a.dds",
"ability_necromancer_015_b.dds",
"ability_necromancer_016.dds",
"ability_necromancer_016_a.dds",
"ability_necromancer_016_b.dds",
"ability_necromancer_017.dds",
"ability_necromancer_017_a.dds",
"ability_necromancer_017_b.dds",
"ability_necromancer_018.dds",
"ability_necromancer_018_a.dds",
	
	
	-- Arcanist
"ability_arcanist_001.dds",
"ability_arcanist_001_a.dds",
"ability_arcanist_001_b.dds",
"ability_arcanist_002.dds",
"ability_arcanist_002_a.dds",
"ability_arcanist_002_b.dds",
"ability_arcanist_003.dds",
"ability_arcanist_003_a.dds",
"ability_arcanist_003_b.dds",
"ability_arcanist_004.dds",
"ability_arcanist_004_a.dds",
"ability_arcanist_004_b.dds",
"ability_arcanist_005.dds",
"ability_arcanist_005_a.dds",
"ability_arcanist_005_b.dds",
"ability_arcanist_006.dds",
"ability_arcanist_006_a.dds",
"ability_arcanist_006_b.dds",
"ability_arcanist_007.dds",
"ability_arcanist_007_a.dds",
"ability_arcanist_007_b.dds",
"ability_arcanist_008.dds",
"ability_arcanist_008_a.dds",
"ability_arcanist_008_b.dds",
"ability_arcanist_009.dds",
"ability_arcanist_009_a.dds",
"ability_arcanist_009_b.dds",
"ability_arcanist_010.dds",
"ability_arcanist_010_a.dds",
"ability_arcanist_010_b.dds",
"ability_arcanist_011.dds",
"ability_arcanist_011_a.dds",
"ability_arcanist_011_b.dds",
"ability_arcanist_012.dds",
"ability_arcanist_012_a.dds",
"ability_arcanist_012_b.dds",
"ability_arcanist_013.dds",
"ability_arcanist_013_a.dds",
"ability_arcanist_013_b.dds",
"ability_arcanist_014.dds",
"ability_arcanist_014_a.dds",
"ability_arcanist_014_b.dds",
"ability_arcanist_015.dds",
"ability_arcanist_015_a.dds",
"ability_arcanist_015_b.dds",
"ability_arcanist_016.dds",
"ability_arcanist_016_a.dds",
"ability_arcanist_016_b.dds",
"ability_arcanist_017.dds",
"ability_arcanist_017_a.dds",
"ability_arcanist_017_b.dds",
"ability_arcanist_018.dds",
"ability_arcanist_018_a.dds",
"ability_arcanist_018_b.dds",

	-- Destro
"ability_destructionstaff_001.dds",
"ability_destructionstaff_001a.dds",
"ability_destructionstaff_001b.dds",
"ability_destructionstaff_002.dds",
"ability_destructionstaff_002a.dds",
"ability_destructionstaff_002b.dds",
"ability_destructionstaff_005.dds",
"ability_destructionstaff_005_a.dds",
"ability_destructionstaff_005_b.dds",
"ability_destructionstaff_008.dds",
"ability_destructionstaff_008_a.dds",
"ability_destructionstaff_008_b.dds",
"ability_destructionstaff_011.dds",
"ability_destructionstaff_011a.dds",
"ability_destructionstaff_011b.dds",
"ability_destructionstaff_012.dds",
"ability_destructionstaff_012_a.dds",
"ability_destructionstaff_012_b.dds",

	-- 2 Handed
"ability_2handed_001.dds",
"ability_2handed_001_a.dds",
"ability_2handed_001_b.dds",
"ability_2handed_002.dds",
"ability_2handed_002_a.dds",
"ability_2handed_002_b.dds",
"ability_2handed_003.dds",
"ability_2handed_003_a.dds",
"ability_2handed_003_b.dds",
"ability_2handed_004.dds",
"ability_2handed_004_a.dds",
"ability_2handed_004_b.dds",
"ability_2handed_005.dds",
"ability_2handed_005_a.dds",
"ability_2handed_005_b.dds",
"ability_2handed_006.dds",
"ability_2handed_006_a.dds",
"ability_2handed_006_b.dds",
	
	-- Bow
"ability_bow_001.dds",
"ability_bow_001_a.dds",
"ability_bow_001_b.dds",
"ability_bow_002.dds",
"ability_bow_002_a.dds",
"ability_bow_002_b.dds",
"ability_bow_003.dds",
"ability_bow_003_a.dds",
"ability_bow_003_b.dds",
"ability_bow_004.dds",
"ability_bow_004_a.dds",
"ability_bow_004_b.dds",
"ability_bow_005.dds",
"ability_bow_005_a.dds",
"ability_bow_005_b.dds",
"ability_bow_006.dds",
"ability_bow_006_a.dds",
"ability_bow_006_b.dds",
	
	-- S&B
"ability_1handed_001.dds",
"ability_1handed_001_a.dds",
"ability_1handed_001_b.dds",
"ability_1handed_002.dds",
"ability_1handed_002_a.dds",
"ability_1handed_002_b.dds",
"ability_1handed_003.dds",
"ability_1handed_003_a.dds",
"ability_1handed_003_b.dds",
"ability_1handed_004.dds",
"ability_1handed_004_a.dds",
"ability_1handed_004_b.dds",
"ability_1handed_005.dds",
"ability_1handed_005_a.dds",
"ability_1handed_005_b.dds",
"ability_1handed_006.dds",
"ability_1handed_006_a.dds",
"ability_1handed_006_b.dds",
	
	-- Dual Wield
"ability_dualwield_001.dds",
"ability_dualwield_001_a.dds",
"ability_dualwield_001_b.dds",
"ability_dualwield_002.dds",
"ability_dualwield_002_a.dds",
"ability_dualwield_002_b.dds",
"ability_dualwield_003.dds",
"ability_dualwield_003_a.dds",
"ability_dualwield_003_b.dds",
"ability_dualwield_004.dds",
"ability_dualwield_004_a.dds",
"ability_dualwield_004_b.dds",
"ability_dualwield_005.dds",
"ability_dualwield_005_a.dds",
"ability_dualwield_005_b.dds",
"ability_dualwield_006.dds",
"ability_dualwield_006_a.dds",
"ability_dualwield_006_b.dds",
	
	-- Restro
"ability_restorationstaff_001.dds",
"ability_restorationstaff_001_a.dds",
"ability_restorationstaff_001_b.dds",
"ability_restorationstaff_002.dds",
"ability_restorationstaff_002a.dds",
"ability_restorationstaff_002b.dds",
"ability_restorationstaff_003.dds",
"ability_restorationstaff_003_a.dds",
"ability_restorationstaff_003_b.dds",
"ability_restorationstaff_004.dds",
"ability_restorationstaff_004a.dds",
"ability_restorationstaff_004b.dds",
"ability_restorationstaff_005.dds",
"ability_restorationstaff_005_a.dds",
"ability_restorationstaff_005_b.dds",
"ability_restorationstaff_006.dds",
"ability_restorationstaff_006_a.dds",
"ability_restorationstaff_006_b.dds",

	
	-- Fighters Guild
"ability_fightersguild_001.dds",
"ability_fightersguild_001_a.dds",
"ability_fightersguild_001_b.dds",
"ability_fightersguild_002.dds",
"ability_fightersguild_002_a.dds",
"ability_fightersguild_002_b.dds",
"ability_fightersguild_003.dds",
"ability_fightersguild_003_a.dds",
"ability_fightersguild_003_b.dds",
"ability_fightersguild_004.dds",
"ability_fightersguild_004_a.dds",
"ability_fightersguild_004_b.dds",
"ability_fightersguild_005.dds",
"ability_fightersguild_005_a.dds",
"ability_fightersguild_005_b.dds",

	-- Mages Guild
"ability_mageguild_001.dds",
"ability_mageguild_001_a.dds",
"ability_mageguild_001_b.dds",
"ability_mageguild_002.dds",
"ability_mageguild_002_a.dds",
"ability_mageguild_002_b.dds",
"ability_mageguild_003.dds",
"ability_mageguild_003_a.dds",
"ability_mageguild_003_b.dds",
"ability_mageguild_004.dds",
"ability_mageguild_004_a.dds",
"ability_mageguild_004_b.dds",
"ability_mageguild_005.dds",
"ability_mageguild_005_a.dds",
"ability_mageguild_005_b.dds",	
	-- Psijic
"ability_psijic_001.dds",
"ability_psijic_001_a.dds",
"ability_psijic_001_b.dds",
"ability_psijic_002.dds",
"ability_psijic_002_a.dds",
"ability_psijic_002_b.dds",
"ability_psijic_003.dds",
"ability_psijic_003_a.dds",
"ability_psijic_003_b.dds",
"ability_psijic_004.dds",
"ability_psijic_004_a.dds",
"ability_psijic_004_b.dds",
"ability_psijic_005.dds",
"ability_psijic_005_a.dds",
"ability_psijic_005_b.dds",
"ability_psijic_006.dds",
"ability_psijic_006_a.dds",
"ability_psijic_006_b.dds",

	
	-- Undaunted
"ability_undaunted_001.dds",
"ability_undaunted_001_a.dds",
"ability_undaunted_001_b.dds",
"ability_undaunted_002.dds",
"ability_undaunted_002_a.dds",
"ability_undaunted_002_b.dds",
"ability_undaunted_003.dds",
"ability_undaunted_003_a.dds",
"ability_undaunted_003_b.dds",
"ability_undaunted_004.dds",
"ability_undaunted_004_a.dds",
"ability_undaunted_004b.dds",
"ability_undaunted_005.dds",
"ability_undaunted_005a.dds",
"ability_undaunted_005b.dds",
	
	-- Assault
"ability_ava_001.dds",
"ability_ava_001_a.dds",
"ability_ava_001_b.dds",
"ability_ava_002.dds",
"ability_ava_002_a.dds",
"ability_ava_002_b.dds",
"ability_ava_003.dds",
"ability_ava_003_a.dds",
"ability_ava_003_b.dds",
"ability_ava_echoing_vigor.dds",
"ability_ava_vigor.dds",
"ability_ava_resolving_vigor.dds",
"ability_ava_magicka_detonation.dds",
"ability_ava_mystic_guard.dds",
"ability_ava_proximity_detonation.dds",
	
	-- Support
"ability_ava_004.dds",
"ability_ava_004_a.dds",
"ability_ava_004_b.dds",
"ability_ava_005.dds",
"ability_ava_005_a.dds",
"ability_ava_005_b.dds",
"ability_ava_006.dds",
"ability_ava_006_a.dds",
"ability_ava_006_b.dds",
"ability_ava_guard.dds",
"ability_ava_inevitable_detonation.dds",
"ability_ava_lingering_flare.dds",
"ability_ava_revealing_flare.dds",
"ability_ava_scorching_flare.dds",
"ability_ava_stalwart_guard.dds",

	-- Volendrung
"ability_artifact_volendrung_001.dds",
"ability_artifact_volendrung_002.dds",
"ability_artifact_volendrung_003.dds",
"ability_artifact_volendrung_004.dds",
"ability_artifact_volendrung_005.dds",
"ability_artifact_volendrung_006.dds",
	
	-- Soul Magic
"ability_otherclass_001.dds",
"ability_otherclass_001_a.dds",
"ability_otherclass_001_b.dds",
"ability_otherclass_002.dds",
"ability_otherclass_002_a.dds",
"ability_otherclass_002_b.dds",
	
	-- Vampire
"ability_u26_vampire_01.dds",
"ability_u26_vampire_01_a.dds",
"ability_u26_vampire_01_b.dds",
"ability_u26_vampire_02.dds",
"ability_u26_vampire_02_a.dds",
"ability_u26_vampire_02_b.dds",
"ability_u26_vampire_03.dds",
"ability_u26_vampire_03_a.dds",
"ability_u26_vampire_03_b.dds",
"ability_u26_vampire_04.dds",
"ability_u26_vampire_04_a.dds",
"ability_u26_vampire_04_b.dds",
"ability_u26_vampire_05.dds",
"ability_u26_vampire_05_a.dds",
"ability_u26_vampire_05_b.dds",
"ability_u26_vampire_06.dds",
"ability_u26_vampire_06_a.dds",
"ability_u26_vampire_06_b.dds",	
	
	-- Werewolf
"ability_werewolf_001.dds",
"ability_werewolf_001_a.dds",
"ability_werewolf_001_b.dds",
"ability_werewolf_002.dds",
"ability_werewolf_002_a.dds",
"ability_werewolf_002_b.dds",
"ability_werewolf_003.dds",
"ability_werewolf_003_a.dds",
"ability_werewolf_003_b.dds",
"ability_werewolf_004_a.dds",
"ability_werewolf_004_b.dds",
"ability_werewolf_004_c.dds",
"ability_werewolf_005_a.dds",
"ability_werewolf_005_b.dds",
"ability_werewolf_005_c.dds",
"ability_werewolf_006_a.dds",
"ability_werewolf_006_b.dds",
"ability_werewolf_006_c.dds",


	-- Test
"ability_healer_019.dds",
"ability_healer_030.dds",
"ability_mage_037.dds",
"ability_mage_044.dds",
"antiquities_ornate_necklace_3.dds",
"consumable_potion_012_type_002.dds",
"death_recap_cold_aoe.dds",
"gear_razorhorndaedric_shoulder_a.dds",
"gear_terrorbear_head_a.dds",
"gear_undaunted_werewolfbehemoth_head_a.dds",
"gear_undfiregiant_head_a.dds",
"gear_undredlord_head_a.dds",
"u30_trial_soulrip.dds",
"u34_vtrial_meta.dds",
"achievement_vvardenfel_061.dds",
"achievement_u25_dun2_flavor_boss_3b.dds",
"ability_debuff_levitate.dds",
"ability_buff_major_slayer.dds",
"ability_buff_major_force.dds",
}

-- Initialize all mismatched base icons by default
local mismatchedIcons = {}
for iconName, _ in pairs(AbilityIconsFramework.ICON_TO_SKILL_NAME) do
    mismatchedIcons[iconName] = true
end

AbilityIconsFramework.DEFAULT_SETTINGS = {
    version = AbilityIconsFramework.SAVEDVARIABLES_VERSION,
    showSkillStyleIcons = false,
    showCustomScribeIcons = true,
    replaceMismatchedBaseIcons = true,
    mismatchedIcons = mismatchedIcons,
}

function AbilityIconsFramework.GenerateReplacementLists()
    for _, icon in ipairs(REPLACEMENT_ICONS) do
        AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE[esoIcon(icon)] = addonIcon(icon)
    end
    AbilityIconsFramework.GenerateScribedSkillsIcons()
end

AbilityIconsFramework.GenerateReplacementLists()