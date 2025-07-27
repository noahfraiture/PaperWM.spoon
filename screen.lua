local CustomScreen = {}

CustomScreen.__index = CustomScreen

---get the tileable bounds for a screen
---@param screen Screen
---@return Frame
local function Screen:getCanvas()
    local screen_frame = screen:frame()
    local left_gap = Config:getGap("left")
    local right_gap = Config:getGap("right")
    local top_gap = Config:getGap("top")
    local bottom_gap = Config:getGap("bottom")

    return Rect(
        screen_frame.x + left_gap,
        screen_frame.y + top_gap,
        screen_frame.w - (left_gap + right_gap),
        screen_frame.h - (top_gap + bottom_gap)
    )
end

return CustomScreen
