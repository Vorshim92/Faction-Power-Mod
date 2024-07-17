-- Utils.lua
Utils = {}
myUtils = Utils
function Utils.getFaction(username, thefaction)
  print("Calling getFaction with username: " .. tostring(username) .. " and faction: " .. tostring(thefaction))

  local factions = Faction:getFactions()
  local faction_count = factions:size()

  if faction_count == 0 then return false end

  for index = 1, faction_count, 1 do
    local faction = factions:get(index - 1)
    if faction:getName() == thefaction then
      local faction_owner_username = faction:getOwner()
      if faction_owner_username == username then
        return true
      end

      local faction_members = faction:getPlayers()
      local faction_members_count = faction_members:size()

      for member_index = 1, faction_members_count, 1 do
        if faction_members:get(member_index - 1) == username then
          return true
        end
      end
    end
  end

  return false
end

function Utils.playerIsOnline(username)
  print("Checking if player is online: " .. tostring(username))
  local onlinePlayers = getOnlinePlayers()

  for i = 1, onlinePlayers:size() do
    local onlinePlayer = onlinePlayers:get(i - 1)
    if onlinePlayer and onlinePlayer:getUsername() == username then
      return true
    end
  end

  return false
end

return Utils
