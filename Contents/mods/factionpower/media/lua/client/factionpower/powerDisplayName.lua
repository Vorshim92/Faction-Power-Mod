
------------------------------------------------------------------------------------------
--
-- @author Vorshim
--
------------------------------------------------------------------------------------------
local utils = require "utils"
------------------------------------------------------------------------------------------
--- Grabs a player's faction if the player is in one.
---
--- @param {String} username - The player in a faction.
---
--- @return {Boolean} - Returns the faction the player is in. If the player is not
---    in a faction, nil is returned.
------------------------------------------------------------------------------------------


local function forceDisplayName()
  thefaction = getSandboxOptions():getOptionByName("FactionPower.name"):getValue();
  if not isClient() then
     return
  end
    
    local player = getPlayer();
    local username = player:getUsername();


    local faction = utils.getFaction(username);
    if faction then
        if getSandboxOptions():getOptionByName("FactionPower.DisplayName"):getValue() then
          local players  = getOnlinePlayers();

          if players == 0 then return end
            for i=0,players:size()-1 do
             local otherplayer = players:get(i)
              if otherplayer and not otherplayer:isDead() then
                local otherusername = otherplayer:getUsername();
               local isfaction = utils.getFaction(otherusername);
               if isfaction then
                otherplayer:setHaloNote( otherusername,  0, 255, 0, 4000);
                -- HaloTextHelper.addTextWithArrow(otherplayer, otherusername, true, HaloTextHelper.getColorGreen());
               end
             end
           end        
        end
    end
end



Events.OnGameStart.Add(forceDisplayName);
Events.EveryTenMinutes.Add(forceDisplayName);





