local _M = {}

function _M.greet(name)
    ngx.say("Greeting from ", name)
end

return _M
