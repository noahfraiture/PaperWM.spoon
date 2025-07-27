---@class Space
---@field index number
---@field windows Window[][]  -- Array of window columns (assuming sub-tables)

local Space = {}
Space.__index = Space

---@return Space
function Space:new(index)
    ---@type Space
    local instance = setmetatable({}, self)

    instance.index = index
    instance.windows = {}
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


---return the first window that's completely on the screen
---@param self Space space to lookup windows
---@param screen_frame Frame the coordinates of the screen
---@pram direction Direction|nil either LEFT or RIGHT
---@return Window|nil
function Space:getFirstVisibleWindow(screen_frame, direction)
    direction = direction or Direction.LEFT
    local distance = math.huge
    local closest = nil

    for _, windows in ipairs(self.windows) do
        local window = windows[1] -- take first window in column
        local d = (function()
            if direction == Direction.LEFT then
                return window:frame().x - screen_frame.x
            elseif direction == Direction.RIGHT then
                return screen_frame.x2 - window:frame().x2
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
---@return Window[]
function Space:getColumn(col) return self.windows[col] end

---@param col number
---@param row number
---@return Window
function Space:getWindow(col, row) return self.windows[col][row] end

function Space:getWindows()
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


---update the column number in windows to be ascending from provided column up
---@param space Space
---@param column number
function Space:updateIndexTable(column)
    local columns = self.windows
    for col = column, #columns do
        for row, window in ipairs(self.windows[col]) do
            index_table[window:id()] = { space = space, col = col, row = row }
        end
    end
end


---update the virtual x position for a table of windows on the specified space
---@param space Space
---@param col number
local function Space:updateVirtualPositions(col, x)
    if Config.swipe_fingers == 0 then return end
    for _, window in ipairs(self.windows[col]) do
        window.x = x
    end
end

return Space
