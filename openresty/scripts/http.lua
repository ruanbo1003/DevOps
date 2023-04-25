
local cjson = require("cjson")

local _M = {}

function _M.run()
    ngx.req.read_body()  -- read_body() before get_body_data()
    local req_body = ngx.req.get_body_data()

    local data = {
        scheme = ngx.var.scheme,
        server_addr = ngx.var.server_addr,
        server_port = ngx.var.server_port,
        remote_addr = ngx.var.remote_addr,
        remote_port = ngx.var.remote_port,
        uri = ngx.var.uri,
        request_method = ngx.var.request_method,
        args = ngx.var.args,
        request_body = cjson.decode(req_body),
        content_length = ngx.var.content_length,
        content_type = ngx.var.content_type,
        cookie_name = ngx.var.cookie_name,
        host = ngx.var.host,
        msec = ngx.var.msec,
        header = ngx.req.get_headers(),
    }

    local response = cjson.encode(data)
    ngx.say(response)
end

return _M
