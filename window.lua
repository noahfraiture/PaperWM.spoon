---@class Window
---@field x number
---@field ui_watcher
---@field space Space
---@field col number
---@field row number

local Window = {}
Window.__index = Window


---@param x number
---@return Window
function Window:new(space, col, row, x)
    ---@type Window
    local instance = setmetatable({
        space = space,
        col = col,
        row = row,
        x = x
    }, self)
    return instance
end

return Window
