local M = {}

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

M.get_arduino_port = function ()
    local file = '/home/Balder/Projects/arduino/blink/sketch.json'

    if not file_exists(file) then print("Could not find sketch.json file") return {} end

    for line in io.lines(file) do
        if string.find(line, "\"port\":") then
            return(string.gsub(line, " *\"port\": ?\"serial://(.+)\"", "%1"))
        end
    end

    return nil
end

return M
