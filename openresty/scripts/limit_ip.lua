
local limit_req = require "resty.limit.req"

local _M = {}

function _M.run()
    --local lim, err = limit_req.new("my_limit_req_store", 200, 100)
    local lim, err = limit_req.new("my_limit_req_store", 1, 1)
    if not lim then
        ngx.log(ngx.ERR,
                "failed to instantiate a resty.limit.req object: ", err)
        return ngx.exit(500)
    end

    local key = ngx.var.binary_remote_addr
    local delay, err = lim:incoming(key, true)
    if not delay then
        if err == "rejected" then
            return ngx.exit(503)
        end
        ngx.log(ngx.ERR, "failed to limit req: ", err)
        return ngx.exit(500)
    end

    ngx.log(ngx.STDERR, "delay:", delay, "err:", err)

    if delay >= 0.001 then
        ngx.header['Retry-After'] = math.floor(delay * 1000)
        ngx.exit(ngx.HTTP_TOO_MANY_REQUESTS)
    end
end

return _M
