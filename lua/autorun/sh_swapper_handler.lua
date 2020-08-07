SWAPPER_DATA = SWAPPER_DATA or {}
SWAPPER_DATA.CVARS = SWAPPER_DATA.CVARS or {}


if SERVER then

SWAPPER_DATA.roles_table = {}
SWAPPER_DATA.teams_table = {}
SWAPPER_DATA.excluded_roles = {}

--Add a Role exception.
--Role1 will be swapped with role2 instead
--Example: Swapper gets killed by a Sidekick and will respawn as Jackal: SWAPPER_DATA:AddRoleException(ROLE_SIDEKICK, ROLE_JACKAL)
function SWAPPER_DATA:AddRoleException(role1, role2)
  if not role1 or not role2 then return end

  SWAPPER_DATA.roles_table[role1] = role2
end

--Add a Team exception.
--If the swapper would receive "role" he will be set to team "team" function SWAPPER_DATA:AddTeamException(ROLE_BODYGUARD, TEAM_NONE)
function SWAPPER_DATA:AddTeamException(role, team)
  if not role or not team then return end

  SWAPPER_DATA.teams_table[role] = team
end

--Add a excluded Role
--If the swapper gets killed by a Role added with this, he will not respawn.
function SWAPPER_DATA:AddExcludedRole(role)
  if not role then return end

  table.insert(SWAPPER_DATA.excluded_roles, role)
end


function SWAPPER_DATA:HandleDeathVictim(ply, role, team)
  ply:SetRole(SWAPPER_DATA:GetRoleToRespawn(role), SWAPPER_DATA:GetTeamToRespawn(role, team))

  local spawnPos, eyeAngle = SWAPPER_DATA:GetRespawnLocation(ply)

  ply:Revive(SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time, function(ply) return IsValid(ply) and not ply:Alive() end, false, false, true, nil, spawnPos, eyeAngle)
  ply:SendRevivalReason("ttt2_swapper_revivereason")
end

function SWAPPER_DATA:HandleDeathAttacker(ply)
  if not SWAPPER_DATA.CVARS.ttt2_swapper_respawn_attacker then
    if SWAPPER_DATA.CVARS.ttt2_swapper_make_attacker_swapper then
        ply:SetRole(ROLE_SWAPPER, TEAM_NONE)
    end
    return
  end

  ply:SetRole(ROLE_SWAPPER, TEAM_NONE)

  local spawnPos, eyeAngle = SWAPPER_DATA:GetRespawnLocation(ply)

  ply:Revive(SWAPPER_DATA.CVARS.ttt2_swapper_respawn_time, function(ply) return IsValid(ply) and not ply:Alive() end, false, false, false, nil, spawnPos, eyeAngle)
  ply:SendRevivalReason("ttt2_swapper_revivereason")
end

function SWAPPER_DATA:GetRoleToRespawn(role)
  if SWAPPER_DATA.roles_table[role] then
    return SWAPPER_DATA.roles_table[role]
  end

  return role
end

function SWAPPER_DATA:GetTeamToRespawn(role, team)
  if SWAPPER_DATA.teams_table[role] then
    return SWAPPER_DATA.teams_table[role]
  end

  return team
end

function SWAPPER_DATA:ShouldSwapp(role)
  if table.HasValue(SWAPPER_DATA.excluded_roles, role) then
    return false
  end

  return true
end

--Stripped out of TTT2 code :P
function SWAPPER_DATA:GetRespawnLocation(ply)
  local spawnEntity = nil
  local spawnPos = nil
  local spawnEyeAngle = nil
  if not SWAPPER_DATA.CVARS.ttt2_swapper_respawn_corpse then
    spawnEntity = spawn.GetRandomPlayerSpawnEntity(ply)

    spawnPos = spawnEntity:GetPos()
    spawnEyeAngle = spawnEntity:EyeAngles()
  end

  return spawnPos, spawnEyeAngle
end

end
