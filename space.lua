local Config = dofile(hs.spoons.resourcePath("screen.lua"))

---@class CustomSpace
---@field native_space Space
---@field windows CustomWindow[][]  -- Array of window columns (assuming sub-tables)
---@field floating CustomWindow[]   -- FLoating windows, so not in a column

local CustomSpace = {}
CustomSpace.__index = CustomSpace

---@return CustomSpace
function CustomSpace:new(native_space)
    ---@type CustomSpace
    local instance = setmetatable({}, self)

    instance.native_space = native_space
    instance.windows = {}
    instance.floating = {}
    return instance
end

local Direction <const> = {
    LEFT = -1,
    RIGHT = 1,
    UP = -2,
    DOWN = 2,
    NEXT = 3,
    PREVIOUS = -3,
    WIDTH = 4,
    HEIGHT = 5,
    ASCENDING = 6,
    DESCENDING = 7
}

function CustomSpace:filter(fn, result)
    for window in self:getCustomWindows() do
        if fn(window) == true then table.insert(result, window) end
    end
    return result
end

---return the first window that's completely on the screen
---@param self CustomSpace space to lookup windows
---@param screen_frame Frame the coordinates of the screen
---@pram direction Direction? either LEFT or RIGHT
---@return CustomWindow?
function CustomSpace:getFirstVisibleCustomWindow(screen_frame, direction)
    direction = direction or Direction.LEFT
    local distance = math.huge
    local closest = nil

    for _, window in ipairs(self.windows) do
        local d = (function()
            if direction == Direction.LEFT then
                return window.window:frame().x - screen_frame.x
            elseif direction == Direction.RIGHT then
                return screen_frame.x2 - window.window:frame().x2
            end
        end)() or math.huge
        if d >= 0 and d < distance then
            distance = d
            closest = window
        end
    end
    return closest
end

---get a column of windows for a space from the windows
---@param col number
---@return CustomWindow[]
function CustomSpace:getColumn(col) return self.windows[col] end

---@param col number
---@param row number
---@return CustomWindow
function CustomSpace:getWindow(col, row) return self.windows[col][row] end

function CustomSpace:getWindows()
    local i, j = 1, 0
    return function()
        j = j + 1
        if self.windows[i] and j > #self.windows[i] then
            i = i + 1
            j = 1
        end

        if i <= #self.windows and self.windows[i] and j <= #self.windows[i] then
            return self.windows[i][j]
        end
    end
end


---update the virtual x position for a table of windows on the specified space
---@param col number
---@param x number
---@return nil
function CustomSpace:updateColumnPosition(col, x)
    if Config.swipe_fingers == 0 then return end
    for _, window in ipairs(self.windows[col]) do
        window.x = x
    end
end

---@return CustomWindow?
function CustomSpace:findWindowById(id)
    for window in self:getCustomWindows() do
        if window.window:id() == id then
            return window
        end
    end
    return nil
end

return CustomSpace
