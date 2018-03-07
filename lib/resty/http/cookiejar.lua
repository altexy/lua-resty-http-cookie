local string_match = string.match
local _COOKIE_METHODS = {}

_COOKIE_METHODS.process = function(self, cookies)
    if not cookies then
        return
    end
    for i = 1, #cookies do
        local key = string_match(cookies[i], "^%s*(%w+)=")
        if key then
            self[key] = cookies[i]
        end
    end
end

_COOKIE_METHODS.get = function(self)
    local t = {}
    for _, v in pairs(self) do
        t[#t + 1] = v
    end
    return t
end

return function()
    return setmetatable({}, _COOKIE_METHODS)
end
