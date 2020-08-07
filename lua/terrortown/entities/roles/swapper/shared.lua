if SERVER then
  AddCSLuaFile()

  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_swapper_old.vmt")

end


function ROLE:PreInitialize()
  self.index = ROLE_SWAPPER
	self.color = Color(0, 255, 150, 255)
	self.abbr = 'swapper'
	self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
	self.scoreKillsMultiplier = 0 -- multiplier for kill of player of another team
	self.scoreTeamKillsMultiplier = -8 -- multiplier for teamkill
	self.preventWin = false

	roles.InitCustomTeam(self.name, {
	    icon = 'vgui/ttt/dynamic/roles/icon_swapper_old',
	    color = self.color
	})
	self.defaultTeam = TEAM_NONE

	self.conVarData = {
		pct = 0.15, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 8, -- minimum amount of players until this role is able to get selected
		credits = 0, -- the starting credits of a specific role
		shopFallback = SHOP_DISABLED,
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 30
	}
end


if SERVER then

hook.Add("PlayerDeath", "TTT2SwapperDeath", function(ply, inflictor, attacker)
  if GetRoundState() ~= ROUND_ACTIVE or ply:GetSubRole() ~= ROLE_SWAPPER or not attacker:IsPlayer() or attacker == ply then return end

  attacker:Kill()

  local newRoleVictim = attacker:GetSubRole()
  local newTeamVictim = attacker:GetSubRoleData().defaultTeam or attacker:GetTeam()

  if not SWAPPER_DATA:ShouldSwapp(newRoleVictim) then return end

  SWAPPER_DATA:HandleRespawnAttacker(attacker)
  SWAPPER_DATA:HandleRespawnVictim(ply, newRoleVictim, newTeamVictim)

  SendFullStateUpdate()
end)

hook.Add("EntityTakeDamage", "TTT2SwapperOverrideDamage", function(target, dmginfo)
  if IsValid(target) and target:IsPlayer() and target:Alive() and not target:IsSpec() and target:GetSubRole() == ROLE_SWAPPER and GetRoundState() == ROUND_ACTIVE then
    if dmginfo:IsFallDamage() then return true end
  end

  local attacker = dmginfo:GetAttacker()

  if not IsValid(attacker) or not attacker:IsPlayer() or attacker:GetSubRole() ~= ROLE_SWAPPER or GetRoundState() ~= ROUND_ACTIVE
    or not IsValid(target) or not target:IsPlayer() then return end

  return true
end)

end
