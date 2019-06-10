hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)

hs.hotkey.bind({"cmd"}, "D", function()
    tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
        local keyCode = event:getKeyCode()
        local keyMap = require"hs.keycodes".map

        if keyCode == keyMap["c"] then
            hs.osascript.applescript([[
                tell application "/Applications/Google Chrome.app"
                    make new window
                    activate
                end tell
            ]])
        elseif keyCode == keyMap["t"] then
            hs.osascript.applescript([[
                tell application "/Applications/iTerm.app"
                    create window with default profile
                    activate
                    tell first window to set zoomed to not zoomed
                end tell
            ]])
        elseif keyCode == keyMap["i"] then
            ip4, ip6 = hs.network.primaryInterfaces()
            ips = hs.network.addresses(ip4)
            hs.alert(ips[1])
        end
        tap:stop()
        return true
    end)
    tap:start()
end)

hs.alert("Ondrej Sika's Hammerspoon config loaded")