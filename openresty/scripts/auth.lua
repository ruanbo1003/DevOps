
local _M = {}

local VALID_TOKENS = {
    ["ab1"] = true,
    ["ab2"] = true,
    ["ab3"] = true,
    ["ab4"] = true,
    ["ab5"] = true,
}

function is_valid_token(table, key)
    return table[key]~=nil
end

function _M.run()
    local header = ngx.req.get_headers()
    local token = header['Token']
    if not token then
        ngx.log(ngx.STDERR, "no Token")
        return false
    end

    if is_valid_token(VALID_TOKENS, token) then
        return true
    else
        return false
    end
end


return _M
