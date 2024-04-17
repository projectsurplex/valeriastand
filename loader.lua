local http_request = syn and syn.request or request;

local body = http_request({Url = 'https://httpbin.org/get', Method = 'GET'}).Body;
local decoded = game:GetService("HttpService"):JSONDecode(body)
local hwid = nil

for header, value in pairs(decoded.headers) do
    if string.find(header, "Fingerprint") then
        hwid = value
        break
    end
end

function validatekey(hwid, key)
    if hwid == nil then
        warn("HWID is nil.")
    elseif key == nil then
        warn("Key is nil.")
    end

    local url = string.format("https://pandadevelopment.net/failsafeValidation?service=valeriastand&hwid=%s&key=%s", hwid, key)
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

local function getloader()
   loadstring(game:HttpGet("https://decrypted.cloud/scripts/killbot2.txt",true))()
end

local key = getgenv().KeyID
wait(2)
local authentication = validatekey(hwid, key) -- Ensure local scope for the variable
print(tostring(authentication))
if authentication == true then
    getloader()
else
    print("Invalid")
end
