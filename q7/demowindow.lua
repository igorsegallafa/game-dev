local demoWindow

function onUpdateMarginButton()
  local newMargin = math.random(0, demoWindow:getHeight())
  demoWindow:getChildById('buttonJump'):setMarginBottom(newMargin)
end

local function onUpdateDemoWindow()
  local buttonJump = demoWindow:getChildById('buttonJump')
  local newMarginX = buttonJump:getMarginRight() + 5

  if newMarginX > (demoWindow:getWidth() - buttonJump:getWidth() - 32) then
    newMarginX = 0
    onUpdateMarginButton()
  end

  buttonJump:setMarginRight(newMarginX)
end

-- public functions
function EnterGame.init()
  demoWindow = g_ui.displayUI('demowindow')
  cycleEvent(onUpdateDemoWindow, 50)
end

function EnterGame.terminate()
  demoWindow:destroy()
  demoWindow = nil
end

function EnterGame.show()
  demoWindow:show()
end