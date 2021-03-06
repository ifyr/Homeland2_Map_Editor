
-- for CCLuaEngine
function __G__TRACKBACK__(errorMessage)
    CCLuaLog("----------------------------------------")
    CCLuaLog("LUA ERROR: "..tostring(errorMessage).."\n")
    CCLuaLog(debug.traceback("", 2))
    CCLuaLog("----------------------------------------")
end

if jit then
    jit.on()
    local status = jit.status()
    if status then
        status = "ON"
    else
        status = "OFF"
    end
    CCLuaLog("LuaJIT status is " .. status)
end


CCFileUtils:sharedFileUtils():addSearchPath("res/")

xpcall(function()
    require("config")
    require("framework.init")

    display.addSpriteFramesWithFile("SheetMapBattle.plist", "SheetMapBattle.png")
    display.addSpriteFramesWithFile("SheetEditor.plist", "SheetEditor.png")

    display.replaceScene(require("editor.EditorScene").new())
end, __G__TRACKBACK__)
