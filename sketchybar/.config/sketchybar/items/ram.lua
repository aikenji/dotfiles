local icons = require "icons"
local colors = require("colors").sections.widgets.battery
local settings = require "settings"

-- Execute the event provider binary which provides the event "ram_load" for
-- the ram load data, which is fired every 1.0 seconds.
sbar.exec "killall ram_load >/dev/null; $CONFIG_DIR/helpers/event_providers/ram_load/bin/ram_load ram_update 1.0"

local ram = sbar.add("item", "ram", {
  position = "right",
  icon = {
    string = icons.ramicons.ram,
    padding_left = 10,
    font = {
      size = 17.0,
    },
  },
  label = {
    string = "RAM ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 12.0,
    },
    align = "right",
    padding_right = 8,
    y_offset = 0,
  },
  padding_right = 8,
})

ram:subscribe("ram_update", function(env)
  local raw = env.pressure
  if not raw then
    return
  end

  -- - "%" and later add " %"
  local usedram = tonumber(raw)
  if not usedram then
    return
  end

  local color = colors.high
  local label = tostring(usedram) .. "%"

  if usedram > 30 then
    if usedram < 60 then
      color = colors.mid
    elseif usedram < 80 then
      color = colors.mid
    else
      color = colors.low
    end
  end

  ram:set {
    label = {
      -- string = "RAM " .. label,
      string = label,
      color = color,
    },
  }
end)

ram:subscribe("mouse.clicked", function(env)
  sbar.exec "open -a 'Activity Monitor'"
end)
