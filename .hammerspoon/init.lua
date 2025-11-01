function isInternalDisplay()
    local screen = hs.screen.primaryScreen()
    if not screen then return false end
    local name = screen:name()
    return name == "Built-in Retina Display" -- change this if your Mac uses a different name
end

function resizeRelative(win)
    if not win then return end
    local screen = win:screen()
    local screenFrame = screen:frame()

    local rw = 0.85
    local rh = 0.9
    if isInternalDisplay() then
        rw = 1
        rh = 1
    end
    local w = screenFrame.w * rw
    local h = screenFrame.h * rh
    local x = screenFrame.x + (screenFrame.w - w) / 2
    local y = screenFrame.y + (screenFrame.h - h) / 2

    win:setFrame({x = x, y = y, w = w, h = h})
end

appWatcher = hs.application.watcher.new(function(appName, eventType, app)
    if eventType == hs.application.watcher.launched then
        hs.timer.doAfter(1, function()
            local win = app:mainWindow()
            if not win then return end

            resizeRelative(win)
        end)
    end
end)

appWatcher:start()
