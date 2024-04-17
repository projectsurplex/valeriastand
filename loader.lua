function validatekey(hwid, key)
    if hwid == nil then
        error("HWID is nil.")
    elseif key == nil then
        error("Key is nil.")
    end

    local url = string.format("https://pandadevelopment.net/failsafeValidation?service=valeria&hwid=%s&key=%s", hwid, key)
    local response = request({
        Url = url,
        Method = "GET"
    })

    local responseData = game:GetService("HttpService"):JSONDecode(response.Body)

    if responseData.status == "success" then
        return true
    else
        return false
    end
end

local userhwid = gethwid()
local key = getgenv().KeyID
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local authentication = validatekey(userhwid, key)
Notification:Notify(
            {Title = "Valeria Killbot", Description = "Validating key..."},
            {OutlineColor = Color3.fromRGB(255, 255, 255),Time = 5, Type = "default"}
    )
wait(2)
if authentication == true then
    Notification:Notify(
            {Title = "Valeria Killbot", Description = "Validated!"},
            {OutlineColor = Color3.fromRGB(255, 255, 255),Time = 5, Type = "default"}
    )
    loadstring(game:HttpGet("https://decrypted.cloud/scripts/killbot2.txt",true))()
else
    Notification:Notify(
            {Title = "Valeria Killbot", Description = "Incorrect Key!"},
            {OutlineColor = Color3.fromRGB(255, 255, 255),Time = 5, Type = "default"}
    )
    wait(2)
end
