--[[
Simple Graphics: An unopinionated graphics API to make hand-made GUIs easy.
Author: Andrew Lalis <andrewlalisofficial@gmail.com>
]]--

local lib = {}

-- Clears a screen or terminal. If c is not nil then the background color will
-- be set prior to clearing.
function lib.clear(m, c)
    if c ~= nil then m.setBackgroundColor(c) end
    m.clear()
end

-- Fills a rectangle from the given X and Y coordinates, with a width and
-- height given by w and h respectively. If c is not nil, then the background
-- color is set to c.
function lib.fillRect(m, x, y, w, h, c)
    if c ~= nil then m.setBackgroundColor(c) end
    for i = 1, w do
        for j = 1, h do
            m.setCursorPos(x+i-1, y+j-1)
            m.write(" ")
        end
    end
end

-- Draws the outline of a rectangle from the given x and y coordinates with a
-- width and height given by w and h respectively. If c is not nil, then the
-- color of the border is set to c.
function lib.drawRect(m, x, y, w, h, c)
    if c ~= nil then m.setBackgroundColor(c) end
    lib.drawXLine(x, x+w-1, y, c)
    lib.drawXLine(x, x+w-1, y+h-1, c)
    lib.drawYLine(y+1, y+h-2, x, c)
    lib.drawYLine(y+1, y+h-2, x+w-1, c)
end

-- Draws a horizontal line from x1 to x2 on the given y level.
function lib.drawXLine(m, x1, x2, y, bg, fg, char)
    char = char or " "
    if bg ~= nil then m.setBackgroundColor(bg) end
    if fg ~= nil then m.setTextColor(fg) end
    for x = x1, x2 do
        m.setCursorPos(x, y)
        m.write(char)
    end
end

-- Draws a vertical line from y1 to y2, on the given x level.
function lib.drawYLine(m, y1, y2, x, bg, fg, char)
    char = char or " "
    if bg ~= nil then m.setBackgroundColor(bg) end
    if fg ~= nil then m.setTextColor(fg) end
    for y = y1, y2 do
        m.setCursorPos(x, y)
        m.write(char)
    end
end

-- Draws text starting at the given x y position.
function lib.drawText(m, x, y, text, fg, bg)
    if fg ~= nil then m.setTextColor(fg) end
    if bg ~= nil then m.setBackgroundColor(bg) end
    m.setCursorPos(x, y)
    m.write(text)
end

-- Draws text such that the center of the text is aligned with the given
-- x and y coordinates.
function lib.drawTextCenter(m, x, y, text, fg, bg)
    lib.drawText(m, x-(#text/2)+1, y, text, fg, bg)
end

-- Draws a button as a plain rectangle with the given background color, and
-- centered text drawn with the foreground color. Returns a table containing
-- x1, y1, x2, y2 coordinates for handling the button's event later.
function lib.drawButton(m, x, y, w, h, text, fg, bg)
    local x1 = x
    local y1 = y
    local x2 = x+w-1
    local y2 = y+h-1
    local midX = x+math.floor((w-1)/2)
    local midY = y+math.floor((h-1)/2)
    lib.fillRect(m, x, y, w, h, bg)
    lib.drawTextCenter(m, midX, midY, text, fg)
    return {x1=x1,y1=y1,x2=x2,y2=y2}
end

return lib