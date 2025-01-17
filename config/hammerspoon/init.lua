
-- toggleApp by bundleId
-- you can find bundleId by running `osascript -e 'id of app "AppName"'`
function toggleApp(bundleId, key)
    hs.hotkey.bind({'cmd', 'ctrl'}, key, function()
        local app = hs.application.get(bundleId)
        if app then
            if app:isFrontmost() then
                app:hide()
            else
                app:activate()
            end
        else
            hs.application.launchOrFocusByBundleID(bundleId)
        end
    end)
end

function toggleTerminalEditor()
    local terminal = hs.application.get("com.github.wez.wezterm")
    local editor = hs.application.get("com.microsoft.VSCode")
    if terminal then
        if terminal:isFrontmost() then
	    if editor then
            	editor:activate()
	    else
                terminal:hide()
	    end
        else
            terminal:activate()
        end
    else
        hs.application.launchOrFocusByBundleID("com.github.wez.wezterm")
    end
end

toggleApp("com.tinyspeck.slackmacgap", "s") -- vscode
toggleApp("com.microsoft.VSCode", "f") -- vscode
toggleApp("company.thebrowser.Browser", "a") -- Arc
toggleApp("com.github.wez.wezterm", "w") -- wezterm

hs.hotkey.bind({'cmd', 'ctrl'}, "j", toggleTerminalEditor)
