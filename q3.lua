-- 1. Renamed function for a better naming
-- 2. Renamed local variables used in loop to iterate through player members
-- 3. Define `player` variable as local
-- 4. Instantiate the Player party member just once
-- 5. Break the loop when party member is found and removed successfully
-- 6. Return true or false to identify if member was removed properly from party

function removeMemberFromPlayerParty(playerId, membername)
  local player = Player(playerId)
  local party = player:getParty()
  
  for _, member in pairs(party:getMembers()) do
    local partyMember = Player(membername)
    
    if member == partyMember then 
      party:removeMember(partyMember)
      return true
    end
  end
  
  return false
end
