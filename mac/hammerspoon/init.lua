hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)

hs.hotkey.bind({"cmd"}, "M", function()
  -- Source Lua implementation - https://github.com/Hammerspoon/hammerspoon/issues/181#issuecomment-69685928
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local id = win:id()

  -- init table to save window state
  savedwin = savedwin or {}
  savedwin[id] = savedwin[id] or {}

  if (savedwin[id].maximized == nil or savedwin[id].maximized == false) then
    savedwin[id].frame = frame
    savedwin[id].maximized = true
    win:maximize()
  else
    savedwin[id].maximized = false
    win:setFrame(savedwin[id].frame)
  end
end)

hs.hotkey.bind({"cmd"}, "D", function()
    tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
        tap:stop()
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
        return true
    end)
    tap:start()
end)

hs.hotkey.bind({"cmd", "shift"}, "space", function()
    status, cmd = hs.dialog.textPrompt("Run", "bash commad")
    output, status
= hs.execute(cmd, true)
    hs.alert(output)
end)

hs.hotkey.bind({"cmd"}, "q", function()
  hs.execute("chunkc tiling::window --close", true)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
  hs.execute("chunkc tiling::desktop --rotate 90", true)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "w", function()
  hs.execute("chunkc tiling::desktop --layout monocle", true)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "e", function()
  hs.execute("chunkc tiling::desktop --layout bsp", true)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "f", function()
  hs.execute("chunkc tiling::window --toggle float", true)
  hs.alert("chunkwm: float toggled")
end)

-- Move focus

hs.hotkey.bind({"alt"}, "h", function()
  hs.execute("chunkc tiling::window --focus west", true)
end)

hs.hotkey.bind({"alt"}, "j", function()
  hs.execute("chunkc tiling::window --focus south", true)
end)

hs.hotkey.bind({"alt"}, "k", function()
  hs.execute("chunkc tiling::window --focus north", true)
end)

hs.hotkey.bind({"alt"}, "l", function()
  hs.execute("chunkc tiling::window --focus east", true)
end)

-- Move window

hs.hotkey.bind({"alt", "shift"}, "h", function()
  hs.execute("chunkc tiling::window --warp west", true)
end)

hs.hotkey.bind({"alt", "shift"}, "j", function()
  hs.execute("chunkc tiling::window --warp south", true)
end)

hs.hotkey.bind({"alt", "shift"}, "k", function()
  hs.execute("chunkc tiling::window --warp north", true)
end)

hs.hotkey.bind({"alt", "shift"}, "l", function()
  hs.execute("chunkc tiling::window --warp east", true)
end)

-- Resize windows

hs.hotkey.bind({"alt", "shift"}, "left", function()
  hs.execute("chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge west", true)
  hs.execute("chunkc tiling::window --use-temporary-ratio -0.05 --adjust-window-edge east", true)
end)

hs.hotkey.bind({"alt", "shift"}, "down", function()
  hs.execute("chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge south", true)
  hs.execute("chunkc tiling::window --use-temporary-ratio -0.05 --adjust-window-edge north", true)
end)

hs.hotkey.bind({"alt", "shift"}, "up", function()
  hs.execute("chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge north", true)
  hs.execute("chunkc tiling::window --use-temporary-ratio -0.05 --adjust-window-edge south", true)
end)

hs.hotkey.bind({"alt", "shift"}, "right", function()
  hs.execute("chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge east", true)
  hs.execute("chunkc tiling::window --use-temporary-ratio -0.05 --adjust-window-edge west", true)
end)

hs.alert("Ondrej Sika's Hammerspoon config loaded")
