-- 1. Created constants for storage key, default value and delay to addEvent.
-- 2. Added `key` parameter to `releaseStorage` function.
-- 3. Fixed the `addEvent` usage, it was missing the delay paramenter.
-- 4. Fixed the comparasion on `onLogout` function to release the storage
--    I believe we want to release the storage when it has some value different than
--    default value (-1).
-- 5. Removed the `return true` from `onLogout` function
--    Probably we should consider a real scenario to understand if it is being
--    used properly, but for this limited scenario, that doesn't makes sense for me.

local MY_STORAGE_KEY = 1000
local DEFAULT_STORAGE_VALUE = -1
local EVENT_STORAGE_DELAY = 1000

local function releaseStorage(key, player)
  player:setStorageValue(key, DEFAULT_STORAGE_VALUE)
end

function onLogout(player)
  if player:getStorageValue(MY_STORAGE_KEY) ~= DEFAULT_STORAGE_VALUE then
    addEvent(releaseStorage, EVENT_STORAGE_DELAY, MY_STORAGE_KEY, player)
  end
end
