---@class CustomWindow
---@field x number
---@field ui_watcher
---@field space CustomSpace?
---@field col number -- nil if is_floating_index
---@field row number -- nil if is_floating_index
---@field is_floating_index number -- nil if col or row
---@field window Window

local CustomWindow = {}
CustomWindow.__index = CustomWindow


---@param x number
---@return CustomWindow
function CustomWindow:new(x, ui_watcher, space, col, row, is_floating_index, window)
    ---@type CustomWindow
    local instance = setmetatable({
        x = x,
        ui_watcher = ui_watcher,
        space = space,
        col = col,
        row = row,
        is_floating_index = is_floating_index,
        window = window
    }, self)
    return instance
end

return CustomWindow
