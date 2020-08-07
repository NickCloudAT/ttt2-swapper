if SERVER then

hook.Add("PostGamemodeLoaded", "TTT2SwapperSetupTables", function()
  -- Role Exceptions
  SWAPPER_DATA:AddRoleException(ROLE_SIDEKICK, ROLE_JACKAL)
  SWAPPER_DATA:AddRoleException(ROLE_ZOMBIE, ROLE_NECROMANCER)
  SWAPPER_DATA:AddRoleException(ROLE_NECROZOMBIE, ROLE_NECROMANCER)
  SWAPPER_DATA:AddRoleException(ROLE_GRAVEROBBER, ROLE_TRAITOR)
  SWAPPER_DATA:AddRoleException(ROLE_DEPUTY, ROLE_DETECTIVE)

  --Team Exceptions
  SWAPPER_DATA:AddTeamException(ROLE_BODYGUARD, TEAM_NONE)

  --Role Exclusions
  SWAPPER_DATA:AddExcludedRole(ROLE_JESTER)
  SWAPPER_DATA:AddExcludedRole(ROLE_SWAPPER)
end)

end
