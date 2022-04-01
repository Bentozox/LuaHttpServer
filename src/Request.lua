---
--- @module Request
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by benjamin.
--- DateTime: 1/04/22 14:18
---

local headersM = require 'http.headers'


function Request(stream)
    local self = {}
    local requestHeaders = stream:get_headers()

    -- Get request headers
    ---@param headerKey string Key of header
    ---@return string Value of header
    self.getRequestHeader = function(headerKey)
        return requestHeaders:get(':' .. headerKey)
    end

    ---Set response headers
    ---@param headers table Table of headers
    ---@param endStream boolean End of stream
    self.setResponseHeaders = function(headers)
        local responseHeaders = headersM.new()

        for headerKey, headerValue in pairs(headers) do
            responseHeaders:append(':' .. headerKey, tostring(headerValue))
        end

        stream:write_headers(responseHeaders, self.getRequestHeader('method') == 'HEAD')
    end

    ---Set response body
    ---@param body string Body of response
    self.write = function(body)
        stream:write_chunk(body, false)
    end

    self.flush = function()
        stream:write_chunk("", true)
    end

    return self
end


return {
    new = Request
}