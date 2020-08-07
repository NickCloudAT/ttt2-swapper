SWAPPER_DATA = SWAPPER_DATA or {}
SWAPPER_DATA.CVARS = SWAPPER_DATA.CVARS or {}

local ttt2_swapper_respawn_time = CreateConVar("ttt2_swapper_respawn_time", 5, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local ttt2_swapper_respawn_corpse = CreateConVar("ttt2_swapper_respawn_corpse", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local ttt2_swapper_respawn_attacker = CreateConVar("ttt2_swapper_respawn_attacker", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local ttt2_swapper_make_attacker_swapper = CreateConVar("ttt2_swapper_make_attacker_swapper", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local ttt2_swapper_jester_mode = CreateConVar("ttt2_swapper_jester_mode", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})

SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time = ttt2_swapper_respawn_time:GetFloat()
SWAPPER_DATA.CVARS.ttt2_swapper_respawn_corpse = ttt2_swapper_respawn_corpse:GetBool()
SWAPPER_DATA.CVARS.ttt2_swapper_respawn_attacker = ttt2_swapper_respawn_attacker:GetBool()
SWAPPER_DATA.CVARS.ttt2_swapper_make_attacker_swapper = ttt2_swapper_make_attacker_swapper:GetBool()
SWAPPER_DATA.CVARS.ttt2_swapper_jester_mode = ttt2_swapper_jester_mode:GetBool()

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicSwapperCVars", function(tbl)
	tbl[ROLE_SWAPPER] = tbl[ROLE_SWAPPER] or {}


  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_respawn_time", slider = true, min = 0, max = 20, decimal = 1, desc = "How long till both respawn in seconds? (def. 5)"})

  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_respawn_corpse", checkbox = true, desc = "Respawn at corpses? (Def. 0)"})
  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_respawn_attacker", checkbox = true, desc = "Respawn attacker? (Def. 0)"})
  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_make_attacker_swapper", checkbox = true, desc = "Make the attacker swapper on death? ttt2_swapper_respawn_attacker needs to be false. (Def. 0)"})
  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_jester_mode", checkbox = true, desc = "Show as Jester to Traitors? (Def. 1)"})
end)


if SERVER then

  cvars.AddChangeCallback("ttt2_swapper_respawn_time", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time = util.StringToType(new, "float")
  end, nil)

  cvars.AddChangeCallback("ttt2_swapper_respawn_corpse", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_respawn_corpse = util.StringToType(new, "bool")
  end, nil)

  cvars.AddChangeCallback("ttt2_swapper_respawn_attacker", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_respawn_attacker = util.StringToType(new, "bool")
  end, nil)

  cvars.AddChangeCallback("ttt2_swapper_make_attacker_swapper", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_make_attacker_swapper = util.StringToType(new, "bool")
  end, nil)

  cvars.AddChangeCallback("ttt2_swapper_jester_mode", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_jester_mode = util.StringToType(new, "bool")
  end, nil)

end
