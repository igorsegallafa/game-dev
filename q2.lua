-- 1. Rename `selectGuildQuery` variable to something simpler
-- 2. Fixed the logic to print all guild names returned by query
-- 3. Free SQL query result when it is done
-- 4. I'd try to use parameterized query instead of formatted string, but
--    I am not sure if it is possible on OTLand or Lua scripting

function printSmallGuildNames(memberCount)
  local query = "SELECT name FROM guilds WHERE max_members < %d;"
  local resultId = db.storeQuery(string.format(query, memberCount))
  
  if resultId ~= false then
    repeat
      local guildName = result.getString(resultId, "name")
      print(guildName)
    until not result.next(resultId)
    
    result.free(resultId)
  end
end
