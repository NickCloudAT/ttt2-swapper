SWAPPER_DATA = SWAPPER_DATA or {}
SWAPPER_DATA.CVARS = SWAPPER_DATA.CVARS or {}

if SERVER then
  SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time = CreateConVar("ttt2_swapper_respawn_time", 5, {FCVAR_NOTIFY, FCVAR_ARCHIVE}):GetFloat()
  SWAPPER_DATA.CVARS.ttt2_swapper_respawn_corpse = CreateConVar("ttt2_swapper_respawn_corpse", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE}):GetBool()
end

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicSwapperCVars", function(tbl)
	tbl[ROLE_SWAPPER] = tbl[ROLE_SWAPPER] or {}


  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_respawn_time", slider = true, min = 0, max = 20, decimal = 1, desc = "ttt2_swapper_respawn_time (def. 5)"})

  table.insert(tbl[ROLE_SWAPPER], {cvar = "ttt2_swapper_respawn_corpse", checkbox = true, desc = "Respawn at corpses? (Def. 0)"})
end)


if SERVER then

  cvars.AddChangeCallback("ttt2_swapper_respawn_time", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time = util.StringToType(new, "float")
  end, nil)

  cvars.AddChangeCallback("ttt2_swapper_respawn_corpse", function(name, old, new)
    SWAPPER_DATA.CVARS.ttt2_swapper_respawn_corpse = util.StringToType(new, "bool")
  end, nil)

end
