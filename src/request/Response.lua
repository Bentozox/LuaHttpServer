---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by benjamin.
--- DateTime: 1/04/22 16:58
---


---@class Response : Object
function Response()
    local self = {}

    ---Called to respond to client.
    ---@param request Request The client request to respond to.
    self.execute = function(request)

    end

    return self
end



return Response