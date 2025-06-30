local AbilityIconsFramework = AbilityIconsFramework

AbilityIconsFramework.SAVEDVARIABLES_VERSION = 1.5

-- Constants
AbilityIconsFramework.MIN_INDEX = 3                  -- First ability index
AbilityIconsFramework.MAX_INDEX = 8                  -- Last ability: 7, Ultimate: 8
AbilityIconsFramework.SCRIBING_ID_KEY = "craftedAbilityId"
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
        if hasIcon(PackIcons, name) then
            icon = PackDirectory .. name
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
    KNOCKBACK = "knockback",
    DISPEL = "dispel",
    SHIELD = "shield",
    PHYSICAL = "physical",
    MULTITARGET = "multi-target",
    BLEED = "bleed",
    TRAUMA = "trauma",
    POISON = "poison",
    DISEASE = "disease",
    MITIGATION = "mitigation",
    TAUNT = "taunt",
    PULL = "pull",
    DEFAULT = "default"
}

function AbilityIconsFramework.GetEffectsList()
    return EFFECT
end

AbilityIconsFramework.DEFAULT = EFFECT.DEFAULT

-- Configuration templates
AbilityIconsFramework.DEFAULT_ADDON_CONFIG = {
    version = AbilityIconsFramework.SAVEDVARIABLES_VERSION,
    saveSettingsGlobally = true,
}

-- Consolidated table for icon names, skill names, main category, class, and skill tree
	AbilityIconsFramework.ICON_TO_SKILL_NAME = {
    -- Weapon Skills
    ["ability_bow_006.dds"] = {
        skillName = "Rapid Fire",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_006_a.dds"] = {
        skillName = "Ballista",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_006_b.dds"] = {
        skillName = "Toxic Barrage",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_001.dds"] = {
        skillName = "Snipe",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_001_b.dds"] = {
        skillName = "Focused Aim",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_001_a.dds"] = {
        skillName = "Lethal Arrow",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_003.dds"] = {
        skillName = "Volley",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_003_b.dds"] = {
        skillName = "Arrow Barrage",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_003_a.dds"] = {
        skillName = "Endless Hail",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_004.dds"] = {
        skillName = "Scatter Shot",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_004_a.dds"] = {
        skillName = "Draining Shot",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_004_b.dds"] = {
        skillName = "Magnum Shot",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_005.dds"] = {
        skillName = "Arrow Spray",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_005_b.dds"] = {
        skillName = "Acid Spray",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_005_a.dds"] = {
        skillName = "Bombard",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_002.dds"] = {
        skillName = "Poison Arrow",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_002_b.dds"] = {
        skillName = "Poison Injection",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Bow"
    },
    ["ability_bow_002_a.dds"] = {
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

    -- Destruction Staff Skills
    ["ability_destructionstaff_012.dds"] = {
        skillName = "Elemental Storm",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_012_b.dds"] = {
        skillName = "Elemental Rage",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_012_a.dds"] = {
        skillName = "Eye of the Storm",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_001.dds"] = {
        skillName = "Force Shock",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_001a.dds"] = {
        skillName = "Crushing Shock",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_001b.dds"] = {
        skillName = "Force Pulse",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_002.dds"] = {
        skillName = "Wall of Elements F",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_002a.dds"] = {
        skillName = "Elemental Blockade F",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_002b.dds"] = {
        skillName = "Unstable Wall of Elements F",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_003.dds"] = {
        skillName = "Wall of Elements L",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_003_a.dds"] = {
        skillName = "Elemental Blockade L",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_003_b.dds"] = {
        skillName = "Unstable Wall of Elements L",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_004.dds"] = {
        skillName = "Wall of Elements I",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_004_a.dds"] = {
        skillName = "Elemental Blockade I",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_004_b.dds"] = {
        skillName = "Unstable Wall of Elements I",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_005.dds"] = {
        skillName = "Destructive Touch",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_005_a.dds"] = {
        skillName = "Destructive Clench",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_005_b.dds"] = {
        skillName = "Destructive Reach",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_006.dds"] = {
        skillName = "Destructive Touch L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_006_a.dds"] = {
        skillName = "Destructive Clench L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_006_b.dds"] = {
        skillName = "Destructive Reach L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_007.dds"] = {
        skillName = "Destructive Touch F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_007_a.dds"] = {
        skillName = "Destructive Clench F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_007_b.dds"] = {
        skillName = "Destructive Reach F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_008.dds"] = {
        skillName = "Destructive Touch I",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_008_a.dds"] = {
        skillName = "Destructive Clench I",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_008_b.dds"] = {
        skillName = "Destructive Reach I",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_009.dds"] = {
        skillName = "Impulse L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_009_a.dds"] = {
        skillName = "Elemental Ring L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_009_b.dds"] = {
        skillName = "Pulsar L",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_010.dds"] = {
        skillName = "Impulse F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_010_a.dds"] = {
        skillName = "Elemental Ring F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
	["ability_destructionstaff_010_b.dds"] = {
        skillName = "Pulsar F",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_011.dds"] = {
        skillName = "Weakness to Elements",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_011a.dds"] = {
        skillName = "Elemental Drain",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_011b.dds"] = {
        skillName = "Elemental Susceptibility",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_008.dds"] = {
        skillName = "Impulse I",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_008_a.dds"] = {
        skillName = "Elemental Ring I",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Destruction Staff"
    },
    ["ability_destructionstaff_008_b.dds"] = {
        skillName = "Pulsar I",
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

    -- Dual Wield Skills
    ["ability_dualwield_006.dds"] = {
        skillName = "Lacerate",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_006_a.dds"] = {
        skillName = "Rend",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_006_b.dds"] = {
        skillName = "Thrive in Chaos",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_002.dds"] = {
        skillName = "Flurry",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_002_a.dds"] = {
        skillName = "Bloodthirst",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_002_b.dds"] = {
        skillName = "Rapid Strikes",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_001.dds"] = {
        skillName = "Twin Slashes",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_001_b.dds"] = {
        skillName = "Blood Craze",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_001_a.dds"] = {
        skillName = "Rending Slashes",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_005.dds"] = {
        skillName = "Whirlwind",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_005_b.dds"] = {
        skillName = "Steel Tornado",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_005_a.dds"] = {
        skillName = "Whirling Blades",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_004.dds"] = {
        skillName = "Blade Cloak",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_004_b.dds"] = {
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
    ["ability_dualwield_003.dds"] = {
        skillName = "Hidden Blade",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_003_a.dds"] = {
        skillName = "Flying Blade",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Dual Wield"
    },
    ["ability_dualwield_003_b.dds"] = {
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

    -- One Hand and Shield Skills
    ["ability_1handed_006.dds"] = {
        skillName = "Shield Wall",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_006_b.dds"] = {
        skillName = "Shield Discipline",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_006_a.dds"] = {
        skillName = "Spell Wall",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_002.dds"] = {
        skillName = "Puncture",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_002_b.dds"] = {
        skillName = "Pierce Armor",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_002_a.dds"] = {
        skillName = "Ransack",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_001.dds"] = {
        skillName = "Low Slash",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_001_b.dds"] = {
        skillName = "Deep Slash",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_001_a.dds"] = {
        skillName = "Heroic Slash",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_004.dds"] = {
        skillName = "Defensive Posture",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_004_b.dds"] = {
        skillName = "Absorb Missile",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_004_a.dds"] = {
        skillName = "Defensive Stance",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_003.dds"] = {
        skillName = "Shield Charge",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_003_b.dds"] = {
        skillName = "Invasion",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_003_a.dds"] = {
        skillName = "Shielded Assault",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_005.dds"] = {
        skillName = "Power Bash",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_005_a.dds"] = {
        skillName = "Power Slam",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "One Hand and Shield"
    },
    ["ability_1handed_005_b.dds"] = {
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
    ["ability_restorationstaff_006.dds"] = {
        skillName = "Panacea",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_006_a.dds"] = {
        skillName = "Life Giver",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_006_b.dds"] = {
        skillName = "Light's Champion",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_004.dds"] = {
        skillName = "Grand Healing",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_004a.dds"] = {
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
    ["ability_restorationstaff_002.dds"] = {
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
    ["ability_restorationstaff_002b.dds"] = {
        skillName = "Rapid Regeneration",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_003.dds"] = {
        skillName = "Blessing of Protection",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_003_a.dds"] = {
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
    ["ability_restorationstaff_001.dds"] = {
        skillName = "Steadfast Ward",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_001_a.dds"] = {
        skillName = "Healing Ward",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_001_b.dds"] = {
        skillName = "Ward Ally",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_005.dds"] = {
        skillName = "Force Siphon",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_005_b.dds"] = {
        skillName = "Quick Siphon",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Restoration Staff"
    },
    ["ability_restorationstaff_005_a.dds"] = {
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
    ["ability_2handed_006.dds"] = {
        skillName = "Berserker Strike",
        position = 1,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_006_b.dds"] = {
        skillName = "Berserker Rage",
        position = 2,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_006_a.dds"] = {
        skillName = "Onslaught",
        position = 3,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_001.dds"] = {
        skillName = "Uppercut",
        position = 4,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_001_a.dds"] = {
        skillName = "Dizzying Swing",
        position = 5,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_001_b.dds"] = {
        skillName = "Wrecking Blow",
        position = 6,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_003.dds"] = {
        skillName = "Critical Charge",
        position = 7,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_003_b.dds"] = {
        skillName = "Critical Rush",
        position = 8,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_003_a.dds"] = {
        skillName = "Stampede",
        position = 9,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_002.dds"] = {
        skillName = "Cleave",
        position = 10,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_002_b.dds"] = {
        skillName = "Brawler",
        position = 11,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_002_a.dds"] = {
        skillName = "Carve",
        position = 12,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_004.dds"] = {
        skillName = "Reverse Slash",
        position = 13,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_004_a.dds"] = {
        skillName = "Executioner",
        position = 14,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_004_b.dds"] = {
        skillName = "Reverse Slice",
        position = 15,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_005.dds"] = {
        skillName = "Momentum",
        position = 16,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_005_a.dds"] = {
        skillName = "Forward Momentum",
        position = 17,
        mainCategory = "Non Class",
        class = "Weapon",
        skillTree = "Two Handed"
    },
    ["ability_2handed_005_b.dds"] = {
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
    ["ability_ava_003.dds"] = {
        skillName = "War Horn",
        position = 1,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_003_a.dds"] = {
        skillName = "Aggressive Horn",
        position = 2,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_003_b.dds"] = {
        skillName = "Sturdy Horn",
        position = 3,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_002.dds"] = {
        skillName = "Rapid Maneuver",
        position = 4,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_002_b.dds"] = {
        skillName = "Charging Maneuver",
        position = 5,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_002_a.dds"] = {
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
    ["ability_ava_resolving_vigor.dds"] = {
        skillName = "Resolving Vigor",
        position = 9,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_001.dds"] = {
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
    ["ability_ava_001_b.dds"] = {
        skillName = "Razor Caltrops",
        position = 12,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_magicka_detonation.dds"] = {
        skillName = "Magicka Detonation",
        position = 13,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },
    ["ability_ava_inevitable_detonation.dds"] = {
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
    ["ability_ava_trample.dds"] = {
        skillName = "Trample",
        position = 16,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Assault"
    },

    -- Support Skills
    ["ability_ava_006.dds"] = {
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
    ["ability_ava_banner_bearer.dds"] = {
        skillName = "Banner Bearer",
        position = 4,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_004.dds"] = {
        skillName = "Siege Shield",
        position = 5,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_004_a.dds"] = {
        skillName = "Propelling Shield",
        position = 6,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_004_b.dds"] = {
        skillName = "Siege Weapon Shield",
        position = 7,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_005.dds"] = {
        skillName = "Purge",
        position = 8,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_005_b.dds"] = {
        skillName = "Cleanse",
        position = 9,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_005_a.dds"] = {
        skillName = "Efficient Purge",
        position = 10,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_guard.dds"] = {
        skillName = "Guard",
        position = 11,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_mystic_guard.dds"] = {
        skillName = "Mystic Guard",
        position = 12,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_stalwart_guard.dds"] = {
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
    ["ability_ava_blinding_flare.dds"] = {
        skillName = "Blinding Flare",
        position = 15,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },
    ["ability_ava_lingering_flare.dds"] = {
        skillName = "Lingering Flare",
        position = 16,
        mainCategory = "Non Class",
        class = "Alliance War",
        skillTree = "Support"
    },

    -- Guild Skills
    ["ability_fightersguild_005.dds"] = {
        skillName = "Dawnbreaker",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_005_b.dds"] = {
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
    ["ability_fightersguild_003.dds"] = {
        skillName = "Silver Bolts",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_003_b.dds"] = {
        skillName = "Silver Leash",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_003_a.dds"] = {
        skillName = "Silver Shards",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_001.dds"] = {
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
    ["ability_fightersguild_001_a.dds"] = {
        skillName = "Turn Evil",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_002.dds"] = {
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
    ["ability_fightersguild_002_a.dds"] = {
        skillName = "Evil Hunter",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Fighters Guild"
    },
    ["ability_fightersguild_004.dds"] = {
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
    ["ability_fightersguild_004_b.dds"] = {
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
    ["ability_mageguild_005.dds"] = {
        skillName = "Meteor",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_005_b.dds"] = {
        skillName = "Ice Comet",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_005_a.dds"] = {
        skillName = "Shooting Star",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_002.dds"] = {
        skillName = "Magelight",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_002_b.dds"] = {
        skillName = "Inner Light",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_002_a.dds"] = {
        skillName = "Radiant Magelight",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_004.dds"] = {
        skillName = "Entropy",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_004_a.dds"] = {
        skillName = "Degeneration",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_004_b.dds"] = {
        skillName = "Structured Entropy",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_001.dds"] = {
        skillName = "Fire Rune",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_001_b.dds"] = {
        skillName = "Scalding Rune",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_001_a.dds"] = {
        skillName = "Volcanic Rune",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_003.dds"] = {
        skillName = "Equilibrium",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_003_b.dds"] = {
        skillName = "Balance",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Mages Guild"
    },
    ["ability_mageguild_003_a.dds"] = {
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
    ["ability_psijic_001.dds"] = {
        skillName = "Undo",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_001_a.dds"] = {
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
    ["ability_psijic_002.dds"] = {
        skillName = "Time Stop",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_002_a.dds"] = {
        skillName = "Borrowed Time",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_002_b.dds"] = {
        skillName = "Time Freeze",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_003.dds"] = {
        skillName = "Imbue Weapon",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_003_b.dds"] = {
        skillName = "Crushing Weapon",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_003_a.dds"] = {
        skillName = "Elemental Weapon",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_005.dds"] = {
        skillName = "Accelerate",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_005_a.dds"] = {
        skillName = "Channeled Acceleration",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_005_b.dds"] = {
        skillName = "Race Against Time",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_006.dds"] = {
        skillName = "Mend Wounds",
        position = 13,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_006_a.dds"] = {
        skillName = "Mend Spirit",
        position = 14,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_006_b.dds"] = {
        skillName = "Symbiosis",
        position = 15,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_004.dds"] = {
        skillName = "Meditate",
        position = 16,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_004_a.dds"] = {
        skillName = "Deep Thoughts",
        position = 17,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },
    ["ability_psijic_004_b.dds"] = {
        skillName = "Introspection",
        position = 18,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Psijic Order"
    },

    -- Undaunted Skills
    ["ability_undaunted_001.dds"] = {
        skillName = "Blood Altar",
        position = 1,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_001_a.dds"] = {
        skillName = "Overflowing Altar",
        position = 2,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_001_b.dds"] = {
        skillName = "Sanguine Altar",
        position = 3,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_003.dds"] = {
        skillName = "Trapping Webs",
        position = 4,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_003_a.dds"] = {
        skillName = "Shadow Silk",
        position = 5,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_003_b.dds"] = {
        skillName = "Tangling Webs",
        position = 6,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_002.dds"] = {
        skillName = "Inner Fire",
        position = 7,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_002_a.dds"] = {
        skillName = "Inner Beast",
        position = 8,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_002_b.dds"] = {
        skillName = "Inner Rage",
        position = 9,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_005.dds"] = {
        skillName = "Bone Shield",
        position = 10,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_005a.dds"] = {
        skillName = "Bone Surge",
        position = 11,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_005b.dds"] = {
        skillName = "Spiked Bone Shield",
        position = 12,
        mainCategory = "Non Class",
        class = "Guild",
        skillTree = "Undaunted"
    },
    ["ability_undaunted_004.dds"] = {
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
    ["ability_artifact_volendrung_006.dds"] = {
        skillName = "Ruinous Cyclone",
        position = 1,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_artifact_volendrung_001.dds"] = {
        skillName = "Rourken's Rebuke",
        position = 2,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_artifact_volendrung_002.dds"] = {
        skillName = "Malacath's Vengeance",
        position = 3,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_artifact_volendrung_003.dds"] = {
        skillName = "Accursed Charge",
        position = 4,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_artifact_volendrung_004.dds"] = {
        skillName = "Pariah's Resolve",
        position = 5,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },
    ["ability_artifact_volendrung_005.dds"] = {
        skillName = "Sundering Swing",
        position = 6,
        mainCategory = "Non Class",
        class = "Pvp Artifacts",
        skillTree = "Volendrung"
    },

    -- Arcanist Skills
    ["ability_arcanist_018.dds"] = {
        skillName = "Vitalizing Glyphic",
        position = 1,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_018_a.dds"] = {
        skillName = "Glyphic of the Tides",
        position = 2,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_018_b.dds"] = {
        skillName = "Resonating Glyphic",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_013.dds"] = {
        skillName = "Runemend",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_013_b.dds"] = {
        skillName = "Audacious Runemend",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_013_a.dds"] = {
        skillName = "Evolving Runemend",
        position = 6,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_014.dds"] = {
        skillName = "Remedy Cascade",
        position = 7,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_014_a.dds"] = {
        skillName = "Cascading Fortune",
        position = 8,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_014_b.dds"] = {
        skillName = "Curative Surge",
        position = 9,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_015.dds"] = {
        skillName = "Chakram Shields",
        position = 10,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_015_a.dds"] = {
        skillName = "Chakram of Destiny",
        position = 11,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_015_b.dds"] = {
        skillName = "Tidal Chakram",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_017.dds"] = {
        skillName = "Arcanist's Domain",
        position = 13,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_017_b.dds"] = {
        skillName = "Reconstructive Domain",
        position = 14,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_017_a.dds"] = {
        skillName = "Zenas' Empowering Disc",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },
    ["ability_arcanist_016.dds"] = {
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
    ["ability_arcanist_016_a.dds"] = {
        skillName = "Passage Between Worlds",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Curative Runeforms"
    },

    -- Herald of the Tome Skills
    ["ability_arcanist_006.dds"] = {
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
    ["ability_arcanist_006_a.dds"] = {
        skillName = "The Tide King's Gaze",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_001.dds"] = {
        skillName = "Runeblades",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_001_b.dds"] = {
        skillName = "Escalating Runeblades",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_001_a.dds"] = {
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
    ["ability_arcanist_003.dds"] = {
        skillName = "Abyssal Impact",
        position = 10,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_003_a.dds"] = {
        skillName = "Cephaliarch's Flail",
        position = 11,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_003_b.dds"] = {
        skillName = "Tentacular Dread",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_005.dds"] = {
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
    ["ability_arcanist_005_b.dds"] = {
        skillName = "Recuperative Treatise",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },
    ["ability_arcanist_004.dds"] = {
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
    ["ability_arcanist_004_a.dds"] = {
        skillName = "Rune of Displacement",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Herald of the Tome"
    },

    -- Soldier of Apocrypha Skills
    ["ability_arcanist_012.dds"] = {
        skillName = "Gibbering Shield",
        position = 1,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_012_b.dds"] = {
        skillName = "Gibbering Shelter",
        position = 2,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_012_a.dds"] = {
        skillName = "Sanctum of the Abyssal Sea",
        position = 3,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_007.dds"] = {
        skillName = "Runic Jolt",
        position = 4,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_007_a.dds"] = {
        skillName = "Runic Embrace",
        position = 5,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_007_b.dds"] = {
        skillName = "Runic Sunder",
        position = 6,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_008.dds"] = {
        skillName = "Runespite Ward",
        position = 7,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_008_b.dds"] = {
        skillName = "Impervious Runeward",
        position = 8,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_008_a.dds"] = {
        skillName = "Spiteward of the Lucid Mind",
        position = 9,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_009.dds"] = {
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
    ["ability_arcanist_009_b.dds"] = {
        skillName = "Unbreakable Fate",
        position = 12,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_010.dds"] = {
        skillName = "Runic Defense",
        position = 13,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_010_b.dds"] = {
        skillName = "Runeguard of Freedom",
        position = 14,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_010_a.dds"] = {
        skillName = "Runeguard of Still Waters",
        position = 15,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_011.dds"] = {
        skillName = "Rune of Eldritch Horror",
        position = 16,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_011_a.dds"] = {
        skillName = "Rune of Uncanny Adoration",
        position = 17,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },
    ["ability_arcanist_011_b.dds"] = {
        skillName = "Rune of the Colorless Pool",
        position = 18,
        mainCategory = "Class",
        class = "Arcanist",
        skillTree = "Soldier of Apocrypha"
    },

    -- Dragonknight Skills
    ["ability_dragonknight_006.dds"] = {
        skillName = "Dragonknight Standard",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_006_a.dds"] = {
        skillName = "Shifting Standard",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_006_b.dds"] = {
        skillName = "Standard of Might",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_001.dds"] = {
        skillName = "Lava Whip",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_001_a.dds"] = {
        skillName = "Flame Lash",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_001_b.dds"] = {
        skillName = "Molten Whip",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_003.dds"] = {
        skillName = "Searing Strike",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_003_b.dds"] = {
        skillName = "Burning Embers",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_003_a.dds"] = {
        skillName = "Venomous Claw",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_004.dds"] = {
        skillName = "Fiery Breath",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_004_b.dds"] = {
        skillName = "Engulfing Flames",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_004_a.dds"] = {
        skillName = "Noxious Breath",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_005.dds"] = {
        skillName = "Fiery Grip",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_005_b.dds"] = {
        skillName = "Chains of Devastation",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_005_a.dds"] = {
        skillName = "Unrelenting Grip",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_002.dds"] = {
        skillName = "Inferno",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_002_b.dds"] = {
        skillName = "Cauterize",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },
    ["ability_dragonknight_002_a.dds"] = {
        skillName = "Flames of Oblivion",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Ardent Flame"
    },

    -- Draconic Power Skills
    ["ability_dragonknight_009.dds"] = {
        skillName = "Dragon Leap",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_009_a.dds"] = {
        skillName = "Ferocious Leap",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_009_b.dds"] = {
        skillName = "Take Flight",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_007.dds"] = {
        skillName = "Spiked Armor",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_007_b.dds"] = {
        skillName = "Hardened Armor",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_007_a.dds"] = {
        skillName = "Volatile Armor",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_010.dds"] = {
        skillName = "Dark Talons",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_010_b.dds"] = {
        skillName = "Burning Talons",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_010_a.dds"] = {
        skillName = "Choking Talons",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_011.dds"] = {
        skillName = "Dragon Blood",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_011_a.dds"] = {
        skillName = "Coagulating Blood",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_011_b.dds"] = {
        skillName = "Green Dragon Blood",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_008.dds"] = {
        skillName = "Protective Scale",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_008_a.dds"] = {
        skillName = "Dragon Fire Scale",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_008_b.dds"] = {
        skillName = "Protective Plate",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_012.dds"] = {
        skillName = "Inhale",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_012_a.dds"] = {
        skillName = "Deep Breath",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },
    ["ability_dragonknight_012_b.dds"] = {
        skillName = "Draw Essence",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Draconic Power"
    },

    -- Earthen Heart Skills
    ["ability_dragonknight_018.dds"] = {
        skillName = "Magma Armor",
        position = 1,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_018_b.dds"] = {
        skillName = "Corrosive Armor",
        position = 2,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_018_a.dds"] = {
        skillName = "Magma Shell",
        position = 3,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_013.dds"] = {
        skillName = "Stonefist",
        position = 4,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_013_b.dds"] = {
        skillName = "Obsidian Shard",
        position = 5,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_013_a.dds"] = {
        skillName = "Stone Giant",
        position = 6,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_015.dds"] = {
        skillName = "Molten Weapons",
        position = 7,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_015_a.dds"] = {
        skillName = "Igneous Weapons",
        position = 8,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_015_b.dds"] = {
        skillName = "Molten Armaments",
        position = 9,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_017.dds"] = {
        skillName = "Obsidian Shield",
        position = 10,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_017a.dds"] = {
        skillName = "Fragmented Shield",
        position = 11,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_017b.dds"] = {
        skillName = "Igneous Shield",
        position = 12,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_014.dds"] = {
        skillName = "Petrify",
        position = 13,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_014_a.dds"] = {
        skillName = "Fossilize",
        position = 14,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_014b.dds"] = {
        skillName = "Shattering Rocks",
        position = 15,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_016.dds"] = {
        skillName = "Ash Cloud",
        position = 16,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_016a.dds"] = {
        skillName = "Cinder Storm",
        position = 17,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },
    ["ability_dragonknight_016b.dds"] = {
        skillName = "Eruption",
        position = 18,
        mainCategory = "Class",
        class = "Dragonknight",
        skillTree = "Earthen Heart"
    },

    -- Necromancer Skills
    ["ability_necromancer_012.dds"] = {
        skillName = "Bone Goliath Transformation",
        position = 1,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_012_a.dds"] = {
        skillName = "Pummeling Goliath",
        position = 2,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_012_b.dds"] = {
        skillName = "Ravenous Goliath",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_007.dds"] = {
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
    ["ability_necromancer_007_b.dds"] = {
        skillName = "Ruinous Scythe",
        position = 6,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_008.dds"] = {
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
    ["ability_necromancer_011.dds"] = {
        skillName = "Bitter Harvest",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_011_a.dds"] = {
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
    ["ability_necromancer_010.dds"] = {
        skillName = "Bone Totem",
        position = 13,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_010_b.dds"] = {
        skillName = "Agony Totem",
        position = 14,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_010_a.dds"] = {
        skillName = "Remote Totem",
        position = 15,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_009.dds"] = {
        skillName = "Grave Grasp",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Bone Tyrant"
    },
    ["ability_necromancer_009_a.dds"] = {
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
    ["ability_necromancer_006.dds"] = {
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
    ["ability_necromancer_006_b.dds"] = {
        skillName = "Pestilent Colossus",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_001.dds"] = {
        skillName = "Flame Skull",
        position = 4,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_001_b.dds"] = {
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
    ["ability_necromancer_002.dds"] = {
        skillName = "Sacrificial Bones",
        position = 7,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
	["ability_necromancer_002_blackedout.dds"] = {
        skillName = "Sacrificial Bones Blackedout",
        position = 8,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_002_a.dds"] = {
        skillName = "Blighted Blastbones",
        position = 9,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
	["ability_necromancer_002_a_blackedout.dds"] = {
        skillName = "Blighted Blastbones Blackedout",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_002_b.dds"] = {
        skillName = "Grave Lord's Sacrifice",
        position = 11,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
	["ability_necromancer_002_b_blackedout.dds"] = {
        skillName = "Grave Lord's Sacrifice Blackedout",
        position = 12,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_004.dds"] = {
        skillName = "Boneyard",
        position = 13,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_004_b.dds"] = {
        skillName = "Avid Boneyard",
        position = 14,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_004_a.dds"] = {
        skillName = "Unnerving Boneyard",
        position = 15,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_003.dds"] = {
        skillName = "Skeletal Mage",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_003_b.dds"] = {
        skillName = "Skeletal Arcanist",
        position = 17,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_003_a.dds"] = {
        skillName = "Skeletal Archer",
        position = 18,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_005.dds"] = {
        skillName = "Shocking Siphon",
        position = 19,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_005_b.dds"] = {
        skillName = "Detonating Siphon",
        position = 20,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },
    ["ability_necromancer_005_a.dds"] = {
        skillName = "Mystic Siphon",
        position = 21,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Grave Lord"
    },

    -- Living Death Skills
    ["ability_necromancer_018.dds"] = {
        skillName = "Reanimate",
        position = 1,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_018_b.dds"] = {
        skillName = "Animate Blastbones",
        position = 2,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_018_a.dds"] = {
        skillName = "Renewing Animation",
        position = 3,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_013.dds"] = {
        skillName = "Render Flesh",
        position = 4,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_013_b.dds"] = {
        skillName = "Blood Sacrifice",
        position = 5,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_013_a.dds"] = {
        skillName = "Resistant Flesh",
        position = 6,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_014.dds"] = {
        skillName = "Expunge",
        position = 7,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_014_b.dds"] = {
        skillName = "Expunge and Modify",
        position = 8,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_014_a.dds"] = {
        skillName = "Hexproof",
        position = 9,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_016.dds"] = {
        skillName = "Life amid Death",
        position = 10,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_016_b.dds"] = {
        skillName = "Enduring Undeath",
        position = 11,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_016_a.dds"] = {
        skillName = "Renewing Undeath",
        position = 12,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_015.dds"] = {
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
    ["ability_necromancer_017.dds"] = {
        skillName = "Restoring Tether",
        position = 16,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_017_a.dds"] = {
        skillName = "Braided Tether",
        position = 17,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },
    ["ability_necromancer_017_b.dds"] = {
        skillName = "Mortal Coil",
        position = 18,
        mainCategory = "Class",
        class = "Necromancer",
        skillTree = "Living Death"
    },

    -- Nightblade Skills
    ["ability_nightblade_007.dds"] = {
        skillName = "Death Stroke",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_007_a.dds"] = {
        skillName = "Incapacitating Strike",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_007_b.dds"] = {
        skillName = "Soul Harvest",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
	["ability_nightblade_007_c.dds"] = {
        skillName = "Incapacitating Strike full",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
		},
    ["ability_nightblade_002.dds"] = {
        skillName = "Veiled Strike",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_002_b.dds"] = {
        skillName = "Concealed Weapon",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_002_a.ddss"] = {
        skillName = "Surprise Attack",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_008.dds"] = {
        skillName = "Teleport Strike",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_008_b.dds"] = {
        skillName = "Ambush",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_008_a.dds"] = {
        skillName = "Lotus Fan",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_017.dds"] = {
        skillName = "Assassin's Blade",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_017_b.dds"] = {
        skillName = "Impale",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_017_a.dds"] = {
        skillName = "Killer's Blade",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_014.dds"] = {
        skillName = "Mark Target",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_014_b.dds"] = {
        skillName = "Piercing Mark",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_014_a.dds"] = {
        skillName = "Reaper's Mark",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_005.dds"] = {
        skillName = "Grim Focus",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_005_b.dds"] = {
        skillName = "Merciless Resolve",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },
    ["ability_nightblade_005_a.dds"] = {
        skillName = "Relentless Focus",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Assassination"
    },

    -- Shadow Skills
    ["ability_nightblade_015.dds"] = {
        skillName = "Consuming Darkness",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_015_a.dds"] = {
        skillName = "Bolstering Darkness",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_015_b.dds"] = {
        skillName = "Veil of Blades",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_004.dds"] = {
        skillName = "Shadow Cloak",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_004_b.dds"] = {
        skillName = "Dark Cloak",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_004_a.dds"] = {
        skillName = "Shadowy Disguise",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_010.dds"] = {
        skillName = "Path of Darkness",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_010_a.dds"] = {
        skillName = "Refreshing Path",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_010_b.dds"] = {
        skillName = "Twisting Path",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_009.dds"] = {
        skillName = "Blur",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_009_a.dds"] = {
        skillName = "Mirage",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_009_b.dds"] = {
        skillName = "Phantasmal Escape",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_016.dds"] = {
        skillName = "Aspect of Terror",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_016_b.dds"] = {
        skillName = "Manifestation of Terror",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_016_a.dds"] = {
        skillName = "Mass Hysteria",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_001.dds"] = {
        skillName = "Summon Shade",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_001_a.dds"] = {
        skillName = "Dark Shade",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },
    ["ability_nightblade_001_b.dds"] = {
        skillName = "Shadow Image",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Shadow"
    },

    -- Siphoning Skills
    ["ability_nightblade_018.dds"] = {
        skillName = "Soul Shred",
        position = 1,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_018_b.dds"] = {
        skillName = "Soul Siphon",
        position = 2,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_018_a.dds"] = {
        skillName = "Soul Tether",
        position = 3,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_012.dds"] = {
        skillName = "Strife",
        position = 4,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_012_b.dds"] = {
        skillName = "Funnel Health",
        position = 5,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_012_a.dds"] = {
        skillName = "Swallow Soul",
        position = 6,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_011.dds"] = {
        skillName = "Malevolent Offering",
        position = 7,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_011_a.dds"] = {
        skillName = "Healthy Offering",
        position = 8,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_011_b.dds"] = {
        skillName = "Shrewd Offering",
        position = 9,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_006.dds"] = {
        skillName = "Cripple",
        position = 10,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_006_b.dds"] = {
        skillName = "Crippling Grasp",
        position = 11,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_006_a.dds"] = {
        skillName = "Debilitate",
        position = 12,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_003.dds"] = {
        skillName = "Siphoning Strikes",
        position = 13,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_003_a.dds"] = {
        skillName = "Leeching Strikes",
        position = 14,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_003_b.dds"] = {
        skillName = "Siphoning Attacks",
        position = 15,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_013.dds"] = {
        skillName = "Drain Power",
        position = 16,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_013_b.dds"] = {
        skillName = "Power Extraction",
        position = 17,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },
    ["ability_nightblade_013_a.dds"] = {
        skillName = "Sap Essence",
        position = 18,
        mainCategory = "Class",
        class = "Nightblade",
        skillTree = "Siphoning"
    },

    -- Sorcerer Skills
    ["ability_sorcerer_storm_atronach.dds"] = {
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
    ["ability_sorcerer_endless_atronachs.dds"] = {
        skillName = "Summon Charged Atronach",
        position = 3,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_unstable_fimiliar.dds"] = {
        skillName = "Summon Unstable Familiar",
        position = 4,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_unstable_fimiliar_summoned.dds"] = {
        skillName = "Summon Unstable Familiar Summoned",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_unstable_clannfear.dds"] = {
        skillName = "Summon Unstable Clannfear",
        position = 6,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_unstable_clannfear_summoned.dds"] = {
        skillName = "Summon Unstable Clannfear Summoned",
        position = 7,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_speedy_familiar.dds"] = {
        skillName = "Summon Volatile Familiar",
        position = 8,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_speedy_familiar_summoned.dds"] = {
        skillName = "Summon Volatile Familiar Summoned",
        position = 9,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_daedric_curse.dds"] = {
        skillName = "Daedric Curse",
        position = 10,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_explosive_curse.dds"] = {
        skillName = "Daedric Prey",
        position = 11,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_velocious_curse.dds"] = {
        skillName = "Haunting Curse",
        position = 12,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_lightning_prey.dds"] = {
        skillName = "Summon Winged Twilight",
        position = 13,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
	},
	["ability_sorcerer_lightning_prey_summoned.dds"] = {
        skillName = "Summon Winged Twilight Summoned",
        position = 14,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_storm_prey.dds"] = {
        skillName = "Summon Twilight Matriarch",
        position = 15,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_storm_prey_summoned.dds"] = {
        skillName = "Summon Twilight Matriarch Summoned",
        position = 16,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_lightning_matriarch.dds"] = {
        skillName = "Summon Twilight Tormentor",
        position = 17,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_lightning_matriarch_summoned.dds"] = {
        skillName = "Summon Twilight Tormentor Summoned",
        position = 18,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_hurricane.dds"] = {
        skillName = "Conjured Ward",
        position = 19,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_typhoon.dds"] = {
        skillName = "Hardened Ward",
        position = 20,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_tempest.dds"] = {
        skillName = "Regenerative Ward",
        position = 21,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_armor.dds"] = {
        skillName = "Bound Armor",
        position = 22,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_aegis.dds"] = {
        skillName = "Bound Aegis",
        position = 23,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
    ["ability_sorcerer_bound_armaments.dds"] = {
        skillName = "Bound Armaments",
        position = 24,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },
	["ability_sorcerer_bound_armaments_proc.dds"] = {
        skillName = "Bound Armaments Proc",
        position = 24,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Daedric Summoning"
    },

    -- Dark Magic Skills
    ["ability_sorcerer_monsoon.dds"] = {
        skillName = "Negate Magic",
        position = 1,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_rushing_winds.dds"] = {
        skillName = "Absorption Field",
        position = 2,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crushing_monsoon.dds"] = {
        skillName = "Suppression Field",
        position = 3,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_thunderclap.dds"] = {
        skillName = "Crystal Shard",
        position = 4,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_thunderstomp.dds"] = {
        skillName = "Crystal Fragments",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
	["ability_sorcerer_thunderstomp_proc.dds"] = {
        skillName = "Crystal Fragments Procked",
        position = 5,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crystalweapon.dds"] = {
        skillName = "Crystal Weapon",
        position = 6,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_cyclone.dds"] = {
        skillName = "Encase",
        position = 7,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_twister.dds"] = {
        skillName = "Shattering Spines",
        position = 8,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_crushing_winds.dds"] = {
        skillName = "Vibrant Shroud",
        position = 9,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_dark_fog.dds"] = {
        skillName = "Rune Prison",
        position = 10,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_weakening_fog.dds"] = {
        skillName = "Defensive Rune",
        position = 11,
        mainCategory = "Class",
        class = "Sorcerer",
        skillTree = "Dark Magic"
    },
    ["ability_sorcerer_dark_haze.dds"] = {
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
    ["ability_sorcerer_daedric_minefield.dds"] = {
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
    ["ability_sorcerer_mage_fury.dds"] = {
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
    ["ability_sorcerer_mage_wraith.dds"] = {
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
    ["ability_sorcerer_thundering_presence.dds"] = {
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
    ["ability_templar_empowering_sweep.dds"] = {
        skillName = "Everlasting Sweep",
        position = 3,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_trained_attacker.dds"] = {
        skillName = "Puncturing Strikes",
        position = 4,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_recovery.dds"] = {
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
    ["ability_templar_returning_spear.dds"] = {
        skillName = "Piercing Javelin",
        position = 7,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_ripping_spear.dds"] = {
        skillName = "Aurora Javelin",
        position = 8,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Aedric Spear"
    },
    ["ability_templar_light_spear.dds"] = {
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
    ["ability_templar_sun_strike.dds"] = {
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
    ["ability_templar_light_strike.dds"] = {
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
    ["ability_templar_unstable_core.dds"] = {
        skillName = "Living Dark",
        position = 14,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_total_dark.dds"] = {
        skillName = "Unstable Core",
        position = 15,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Dawn's Wrath"
    },
    ["ability_templar_over_exposure.dds"] = {
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
    ["ability_templar_stendarr_aura.dds"] = {
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
    ["ability_templar_restoring_sigil.dds"] = {
        skillName = "Restoring Aura",
        position = 10,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },
    ["ability_templar_life_giving_sigil.dds"] = {
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
    ["ability_templar_purifying_ritual.dds"] = {
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
    ["ability_templar_uninterrupted_focus.dds"] = {
        skillName = "Restoring Focus",
        position = 18,
        mainCategory = "Class",
        class = "Templar",
        skillTree = "Restoring Light"
    },

    -- Warden Skills
    ["ability_warden_018.dds"] = {
        skillName = "Feral Guardian",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_018_b.dds"] = {
        skillName = "Eternal Guardian",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_018_c.dds"] = {
        skillName = "Wild Guardian",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_013.dds"] = {
        skillName = "Dive",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_013_b.dds"] = {
        skillName = "Cutting Dive",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_013_a.dds"] = {
        skillName = "Screaming Cliff Racer",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_015.dds"] = {
        skillName = "Scorch",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_015_a.dds"] = {
        skillName = "Deep Fissure",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_015_b.dds"] = {
        skillName = "Subterranean Assault",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_014.dds"] = {
        skillName = "Swarm",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_014_a.dds"] = {
        skillName = "Fetcher Infection",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_014_b.dds"] = {
        skillName = "Growing Swarm",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_017_a.dds"] = {
        skillName = "Betty Netch",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_017.dds"] = {
        skillName = "Blue Betty",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_017_b.dds"] = {
        skillName = "Bull Netch",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_016.dds"] = {
        skillName = "Falcon's Swiftness",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_016_a.dds"] = {
        skillName = "Bird of Prey",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },
    ["ability_warden_016_b.dds"] = {
        skillName = "Deceptive Predator",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Animal Companions"
    },

    -- Green Balance Skills
    ["ability_warden_012.dds"] = {
        skillName = "Secluded Grove",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_012_a.dds"] = {
        skillName = "Enchanted Forest",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_012_b.dds"] = {
        skillName = "Healing Thicket",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_008.dds"] = {
        skillName = "Fungal Growth",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_008_b.dds"] = {
        skillName = "Enchanted Growth",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_008_a.dds"] = {
        skillName = "Soothing Spores",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_007.dds"] = {
        skillName = "Healing Seed",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_007_b.dds"] = {
        skillName = "Budding Seeds",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_007_c.dds"] = {
        skillName = "Corrupting Pollen",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_010.dds"] = {
        skillName = "Living Vines",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_010_a.dds"] = {
        skillName = "Leeching Vines",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_010_b.dds"] = {
        skillName = "Living Trellis",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_009.dds"] = {
        skillName = "Lotus Flower",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_009_a.dds"] = {
        skillName = "Green Lotus",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_009_b.dds"] = {
        skillName = "Lotus Blossom",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_011.dds"] = {
        skillName = "Nature's Grasp",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_011_a.dds"] = {
        skillName = "Bursting Vines",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },
    ["ability_warden_011_b.dds"] = {
        skillName = "Nature's Embrace",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Green Balance"
    },

    -- Winter's Embrace Skills
    ["ability_warden_006.dds"] = {
        skillName = "Sleet Storm",
        position = 1,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_006_a.dds"] = {
        skillName = "Northern Storm",
        position = 2,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_006_b.dds"] = {
        skillName = "Permafrost",
        position = 3,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_001.dds"] = {
        skillName = "Frost Cloak",
        position = 4,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_001_a.dds"] = {
        skillName = "Expansive Frost Cloak",
        position = 5,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_001_b.dds"] = {
        skillName = "Ice Fortress",
        position = 6,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_004.dds"] = {
        skillName = "Impaling Shards",
        position = 7,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_004_a.dds"] = {
        skillName = "Gripping Shards",
        position = 8,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_004_b.dds"] = {
        skillName = "Winter's Revenge",
        position = 9,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_003.dds"] = {
        skillName = "Arctic Wind",
        position = 10,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_003_b.dds"] = {
        skillName = "Arctic Blast",
        position = 11,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_003_a.dds"] = {
        skillName = "Polar Wind",
        position = 12,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_002.dds"] = {
        skillName = "Crystallized Shield",
        position = 13,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_002_a.dds"] = {
        skillName = "Crystallized Slab",
        position = 14,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_002_b.dds"] = {
        skillName = "Shimmering Shield",
        position = 15,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_005.dds"] = {
        skillName = "Frozen Gate",
        position = 16,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_005_a.dds"] = {
        skillName = "Frozen Device",
        position = 17,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },
    ["ability_warden_005_b.dds"] = {
        skillName = "Frozen Retreat",
        position = 18,
        mainCategory = "Class",
        class = "Warden",
        skillTree = "Winter's Embrace"
    },

    -- World Skills
    ["ability_otherclass_002.dds"] = {
        skillName = "Soul Strike",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_otherclass_002_a.dds"] = {
        skillName = "Shatter Soul",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_otherclass_002_b.dds"] = {
        skillName = "Soul Assault",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_otherclass_001.dds"] = {
        skillName = "Soul Trap",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_otherclass_001_b.dds"] = {
        skillName = "Consuming Trap",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Soul Magic"
    },
    ["ability_otherclass_001_a.dds"] = {
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
    ["ability_u26_vampire_06.dds"] = {
        skillName = "Blood Scion",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_06_b.dds"] = {
        skillName = "Perfect Scion",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_06_a.dds"] = {
        skillName = "Swarming Scion",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_01.dds"] = {
        skillName = "Eviscerate",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_01_b.dds"] = {
        skillName = "Arterial Burst",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_01_a.dds"] = {
        skillName = "Blood for Blood",
        position = 6,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_02.dds"] = {
        skillName = "Blood Frenzy",
        position = 7,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_02_b.dds"] = {
        skillName = "Sated Fury",
        position = 8,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_02_a.dds"] = {
        skillName = "Simmering Frenzy",
        position = 9,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_03.dds"] = {
        skillName = "Vampiric Drain",
        position = 10,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_03_a.dds"] = {
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
    ["ability_u26_vampire_04.dds"] = {
        skillName = "Mesmerize",
        position = 13,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_04_a.dds"] = {
        skillName = "Hypnosis",
        position = 14,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_04_b.dds"] = {
        skillName = "Stupefy",
        position = 15,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_05.dds"] = {
        skillName = "Mist Form",
        position = 16,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_05_b.dds"] = {
        skillName = "Blood Mist",
        position = 17,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },
    ["ability_u26_vampire_05_a.dds"] = {
        skillName = "Elusive Mist",
        position = 18,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Vampire"
    },

    -- Werewolf Skills
    ["ability_werewolf_001.dds"] = {
        skillName = "Werewolf Transformation",
        position = 1,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_001_a.dds"] = {
        skillName = "Pack Leader",
        position = 2,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_001_b.dds"] = {
        skillName = "Werewolf Berserker",
        position = 3,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_002.dds"] = {
        skillName = "Pounce",
        position = 4,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_002_b.dds"] = {
        skillName = "Brutal Pounce",
        position = 5,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_002_a.dds"] = {
        skillName = "Feral Pounce",
        position = 6,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_004_a.dds"] = {
        skillName = "Hircine's Bounty",
        position = 7,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_004_c.dds"] = {
        skillName = "Hircine's Fortitude",
        position = 8,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_004_b.dds"] = {
        skillName = "Hircine's Rage",
        position = 9,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_003.dds"] = {
        skillName = "Roar",
        position = 10,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_003_a.dds"] = {
        skillName = "Deafening Roar",
        position = 11,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_003_b.dds"] = {
        skillName = "Ferocious Roar",
        position = 12,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_005_a.dds"] = {
        skillName = "Piercing Howl",
        position = 13,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_005_c.dds"] = {
        skillName = "Howl of Agony",
        position = 14,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_005_b.dds"] = {
        skillName = "Howl of Despair",
        position = 15,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_006_a.dds"] = {
        skillName = "Infectious Claws",
        position = 16,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_006_b.dds"] = {
        skillName = "Claws of Anguish",
        position = 17,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
    ["ability_werewolf_006_c.dds"] = {
        skillName = "Claws of Life",
        position = 18,
        mainCategory = "Non Class",
        class = "World",
        skillTree = "Werewolf"
    },
	
	-- Armor
	["ability_armor_001.dds"] = {
        skillName = "Unstoppable",
        position = 1,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Heavy"
    },
	["ability_armor_001_a.dds"] = {
        skillName = "Unstoppable Brute",
        position = 2,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Heavy"
    },
	["ability_armor_001_b.dds"] = {
        skillName = "Immovable",
        position = 3,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Heavy"
    },
	["ability_armor_002.dds"] = {
        skillName = "Evasion",
        position = 1,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Medium"
    },
	["ability_armor_002_a.dds"] = {
        skillName = "Shuffle",
        position = 2,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Medium"
    },
	["ability_armor_002_b.dds"] = {
        skillName = "Elude",
        position = 3,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Medium"
    },
	["ability_armor_003.dds"] = {
        skillName = "Annulment",
        position = 1,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Light"
    },
	["ability_armor_003_a.dds"] = {
        skillName = "Dampen Magicka",
        position = 2,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Light"
    },
	["ability_armor_003_b.dds"] = {
        skillName = "Harness Magicka",
        position = 3,
        mainCategory = "Non Class",
        class = "Armor",
        skillTree = "Light"
    },
	
	-- Other
	["ability_healer_019.dds"] = {
        skillName = "PA",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Buffs"
    },
	["ability_healer_030.dds"] = {
        skillName = "Pillager",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Buffs"
    },
	["ability_mage_037.dds"] = {
        skillName = "Turning Tide",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["ability_mage_044.dds"] = {
        skillName = "MK",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["antiquities_ornate_necklace_3.dds"] = {
        skillName = "Pearls",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Mythics"
    },
	["consumable_potion_012_type_002.dds"] = {
        skillName = "Arkasis",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["death_recap_cold_aoe.dds"] = {
        skillName = "Depths",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["gear_razorhorndaedric_shoulder_a.dds"] = {
        skillName = "Spaulder",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Mythics"
    },
	["gear_terrorbear_head_a.dds"] = {
        skillName = "Archdruid",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["gear_undaunted_werewolfbehemoth_head_a.dds"] = {
        skillName = "Zaudrus",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["gear_undfiregiant_head_a.dds"] = {
        skillName = "Encratis",
        position = 3,
        mainCategory = "Buffs/Sets",
        class = "Armor",
        skillTree = "Light"
    },
	["gear_undredlord_head_a.dds"] = {
        skillName = "Harness Magicka",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["u30_trial_soulrip.dds"] = {
        skillName = "Sul-Xan",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["u34_vtrial_meta.dds"] = {
        skillName = "Coral",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["achievement_vvardenfel_061.dds"] = {
        skillName = "Ansuul",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["achievement_u25_dun2_flavor_boss_3b.dds"] = {
        skillName = "Aegis Caller",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["ability_debuff_levitate.dds"] = {
        skillName = "Acuity",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["ability_buff_major_slayer.dds"] = {
        skillName = "Major Slayer",
        position = 3,
        mainCategory = "Other",
        class = "Buffs",
        skillTree = "Major"
    },
	["ability_buff_major_force.dds"] = {
        skillName = "Major Force",
        position = 3,
        mainCategory = "Other",
        class = "Buffs",
        skillTree = "Major"
    },
	["ability_rogue_042.dds"] = {
        skillName = "Highland Sentinel",
        position = 3,
        mainCategory = "Other",
        class = "Gear",
        skillTree = "Procs"
    },
	["crownpotion_trires.dds"] = {
        skillName = "Crown Tristat",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
	["consumable_potion_001_type_005.dds"] = {
        skillName = "Tristat",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
	["consumable_potion_002_type_005.dds"] = {
        skillName = "im tired",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
	["consumable_potion_003_type_005.dds"] = {
        skillName = "im tired",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
	["consumable_potion_004_type_005.dds"] = {
        skillName = "im tired",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
	["consumable_potion_006_type_005.dds"] = {
        skillName = "im tired",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
		},
	["consumable_potion_007_type_005.dds"] = {
        skillName = "im tired",
        position = 3,
        mainCategory = "Other",
        class = "Potions",
        skillTree = "Tristat"
    },
}

function AbilityIconsFramework.GenerateScribedSkillsIcons()

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.BANNER_BEARER] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 12,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_support_flame.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_support_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_support_magic.dds"),
        [EFFECT.RESOURCES] = addonIcon("ability_grimoire_support_resources.dds"),
        [EFFECT.MULTITARGET] = addonIcon("ability_grimoire_support_multitarget.dds"),
        [EFFECT.MITIGATION] = addonIcon("ability_grimoire_support_mitigation.dds"),
		[EFFECT.PHYSICAL] = addonIcon("ability_grimoire_support_physical.dds"),
		[EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_support_immobilize.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_support.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.ELEMENTAL_EXPLOSION] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 5,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_staffdestro_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_staffdestro_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_staffdestro_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_staffdestro_magic.dds"),
        [EFFECT.DISPEL] = addonIcon("ability_grimoire_staffdestro_dispel.dds"),
        [EFFECT.TRAUMA] = addonIcon("ability_grimoire_staffdestro_trauma.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_staffdestro_physical.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_staffdestro_knockback.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_staffdestro_stun.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_staffdestro.dds")
    }
    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.MENDERS_BOND] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 6,
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_staffresto_magic.dds"),
        [EFFECT.RESOURCES] = addonIcon("ability_grimoire_staffresto_resources.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_staffresto_shield.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_staffresto_immobilize.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_staffresto_heal.dds"),
        [EFFECT.ULTIMATE] = addonIcon("ability_grimoire_staffresto_ultimate.dds"),
        [EFFECT.MITIGATION] = addonIcon("ability_grimoire_staffresto_mitigation.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_staffresto.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SHIELD_THROW] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 3,
        [EFFECT.FROST] = addonIcon("ability_grimoire_1handed_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_1handed_magic.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_1handed_immobilize.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_1handed_physical.dds"),
        [EFFECT.MULTITARGET] = addonIcon("ability_grimoire_1handed_multitarget.dds"),
        [EFFECT.TAUNT] = addonIcon("ability_grimoire_1handed_taunt.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_1handed_knockback.dds"),
        [EFFECT.PULL] = addonIcon("ability_grimoire_1handed_pull.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_1handed.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SMASH] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 4,
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_2handed_magic.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_2handed_heal.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_2handed_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_2handed_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_2handed_poison.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_2handed_physical.dds"),
        [EFFECT.TAUNT] = addonIcon("ability_grimoire_2handed_taunt.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_2handed_knockback.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_2handed_stun.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_2handed.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.SOUL_BURST] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 8,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_soulmagic2_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_soulmagic2_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_soulmagic2_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_soulmagic2_magic.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_soulmagic2_heal.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_soulmagic2_immobilize.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_soulmagic2_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_soulmagic2_bleed.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_soulmagic2_disease.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_soulmagic2_physical.dds"),
        [EFFECT.PULL] = addonIcon("ability_grimoire_soulmagic2_pull.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_soulmagic2.dds")
    }
    
    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TORCHBEARER] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 10,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_fightersguild_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_fightersguild_frost.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_fightersguild_heal.dds"),
        [EFFECT.ULTIMATE] = addonIcon("ability_grimoire_fightersguild_ultimate.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_fightersguild_bleed.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_fightersguild_physical.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_fightersguild_knockback.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_fightersguild_stun.dds"),
        [EFFECT.ULTIMATE] = addonIcon("ability_grimoire_fightersguild_ultimate.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_fightersguild.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TRAMPLE] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 12,
        [EFFECT.FROST] = addonIcon("ability_grimoire_assault_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_assault_magic.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_assault_stun.dds"),
        [EFFECT.DISPEL] = addonIcon("ability_grimoire_assault_dispel.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_assault_physical.dds"),
        [EFFECT.TRAUMA] = addonIcon("ability_grimoire_assault_trauma.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_assault_disease.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_assault_knockback.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_assault.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.TRAVELING_KNIFE] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 7,
        [EFFECT.FROST] = addonIcon("ability_grimoire_dualwield_frost.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_dualwield_magic.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_dualwield_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_dualwield_poison.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_dualwield_physical.dds"),
        [EFFECT.MULTITARGET] = addonIcon("ability_grimoire_dualwield_multitarget.dds"),
        [EFFECT.PULL] = addonIcon("ability_grimoire_dualwield_pull.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_dualwield_stun.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_dualwield.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.ULFSILDS_CONTINGENCY] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 9,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_magesguild_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_magesguild_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_magesguild_shock.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_magesguild_magic.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_magesguild_bleed.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_magesguild_heal.dds"),
        [EFFECT.KNOCKBACK] = addonIcon("ability_grimoire_magesguild_knockback.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_magesguild_shield.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_magesguild_immobilize.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_magesguild.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.VAULT] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 1,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_bow_flame.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_bow_heal.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_bow_bleed.dds"),
        [EFFECT.POISON] = addonIcon("ability_grimoire_bow_poison.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_bow_disease.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_bow_physical.dds"),
        [EFFECT.TAUNT] = addonIcon("ability_grimoire_bow_taunt.dds"),
        [EFFECT.IMMOBILIZE] = addonIcon("ability_grimoire_bow_immobilize.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_bow.dds")
    }

    AbilityIconsFramework.CUSTOM_ABILITY_ICONS[DEFAULT_ICONS.WIELD_SOUL] = {
        [AbilityIconsFramework.SCRIBING_ID_KEY] = 2,
        [EFFECT.FLAME] = addonIcon("ability_grimoire_soulmagic1_flame.dds"),
        [EFFECT.FROST] = addonIcon("ability_grimoire_soulmagic1_frost.dds"),
        [EFFECT.SHOCK] = addonIcon("ability_grimoire_soulmagic1_shock.dds"),
        [EFFECT.PHYSICAL] = addonIcon("ability_grimoire_soulmagic1_physical.dds"),
        [EFFECT.MAGIC] = addonIcon("ability_grimoire_soulmagic1_magic.dds"),
        [EFFECT.HEAL] = addonIcon("ability_grimoire_soulmagic1_heal.dds"),
        [EFFECT.STUN] = addonIcon("ability_grimoire_soulmagic1_stun.dds"),
        [EFFECT.SHIELD] = addonIcon("ability_grimoire_soulmagic1_shield.dds"),
        [EFFECT.BLEED] = addonIcon("ability_grimoire_soulmagic1_bleed.dds"),
        [EFFECT.DISEASE] = addonIcon("ability_grimoire_soulmagic1_disease.dds"),
        [EFFECT.PULL] = addonIcon("ability_grimoire_soulmagic1_pull.dds"),
        [EFFECT.DEFAULT] = addonIcon("ability_grimoire_soulmagic1.dds")
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
"ability_sorcerer_lightning_matriarch_summoned.dds",
"ability_sorcerer_lightning_prey_summoned.dds",
"ability_sorcerer_speedy_familiar_summoned.dds",
"ability_sorcerer_storm_prey_summoned.dds",
"ability_sorcerer_thunder_burst.dds",
"ability_sorcerer_thunderclap.dds",
"ability_sorcerer_thunderstomp.dds",
"ability_sorcerer_thunderstomp_proc.dds",
"ability_sorcerer_unstable_clannfear_summoned.dds",
"ability_sorcerer_unstable_fimiliar_summoned.dds",
"ability_sorcerer_bound_armaments_proc.dds",

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
"ability_nightblade_007_c.dds",
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
"ability_necromancer_002_a_blackedout.dds",
"ability_necromancer_002_b_blackedout.dds",
"ability_necromancer_002_blackedout.dds",
	
	
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
"ability_destructionstaff_003.dds",
"ability_destructionstaff_003_a.dds",
"ability_destructionstaff_003_b.dds",
"ability_destructionstaff_004.dds",
"ability_destructionstaff_004_a.dds",
"ability_destructionstaff_004_b.dds",
"ability_destructionstaff_005.dds",
"ability_destructionstaff_005_a.dds",
"ability_destructionstaff_005_b.dds",
"ability_destructionstaff_006.dds",
"ability_destructionstaff_006_a.dds",
"ability_destructionstaff_006_b.dds",
"ability_destructionstaff_007.dds",
"ability_destructionstaff_007_a.dds",
"ability_destructionstaff_007_b.dds",
"ability_destructionstaff_008.dds",
"ability_destructionstaff_008_a.dds",
"ability_destructionstaff_008_b.dds",
"ability_destructionstaff_009.dds",
"ability_destructionstaff_009_a.dds",
"ability_destructionstaff_009_b.dds",
"ability_destructionstaff_010.dds",
"ability_destructionstaff_010_a.dds",
"ability_destructionstaff_010_b.dds",
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

	-- Armor
"ability_armor_001.dds",
"ability_armor_001_a.dds",
"ability_armor_001_b.dds",
"ability_armor_002.dds",
"ability_armor_002_a.dds",
"ability_armor_002_b.dds",
"ability_armor_003.dds",
"ability_armor_003_a.dds",
"ability_armor_003_b.dds",

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
"ability_rogue_042.dds",
"crownpotion_trires.dds",
"consumable_potion_001_type_005.dds",
"consumable_potion_002_type_005.dds",
"consumable_potion_003_type_005.dds",
"consumable_potion_004_type_005.dds",
"consumable_potion_006_type_005.dds",
"consumable_potion_007_type_005.dds",
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