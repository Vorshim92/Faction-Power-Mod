
------------------------------------------------------------------------------------------
--
-- @author Vorshim
--
------------------------------------------------------------------------------------------
local thefaction;
------------------------------------------------------------------------------------------
--- Grabs a player's faction if the player is in one.
---
--- @param {String} username - The player in a faction.
---
--- @return {Boolean} - Returns the faction the player is in. If the player is not
---    in a faction, nil is returned.
------------------------------------------------------------------------------------------

local getFaction = function(username)

  -- ArrayList<Faction>
  local factions      = Faction:getFactions();
  local faction_count = factions:size();

  -- Make sure that we have factions on the server before trying to locate the
  ---  instance of the player's faction.
  if faction_count == 0 then return false end

  -- Go through all factions and compare usernames of members to the player.
  for index = 1, faction_count, 1 do

    local faction = factions:get(index - 1);

    if faction:getName() == thefaction then
        local faction_owner_username = faction:getOwner();
        if faction_owner_username == username then
          return true
        end

        -- ArrayList<String>
        local faction_members       = faction:getPlayers();
        local faction_members_count = faction_members:size();

        -- Go through the members to see if the username of the player is present.
        for member_index = 1, faction_members_count, 1 do
          -- If the username is found in the members list, return the faction as true.
          if faction_members:get(member_index - 1) == username then
            return true
          end
        end
     end
  end

  -- No faction has the player's name in it. Return false.
  return false;

end


-- @param {String} username -
--
-- @return {boolean} -
------------------------------------------------------------------------------------------
local playerIsOnline = function(username)
  --print(" - checking " .. tostring(username));

  -- mr crabby legs was here
  local onlinePlayers = getOnlinePlayers();

  for i = 1, onlinePlayers:size()
  do
      local onlinePlayer = onlinePlayers:get(i - 1);

      if onlinePlayer and onlinePlayer:getUsername() == username
      then
          --print(" -> player is online");

          return true;
      end
  end

  --print(" -> player is offline");

  return false;
end



