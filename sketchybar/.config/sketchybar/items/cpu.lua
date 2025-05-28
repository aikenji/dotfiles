local icons = require "icons"
local colors = require("colors").sections.widgets.battery
local settings = require "settings"

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec "killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0"

local cpu = sbar.add("item", "cpu", {
  position = "right",
  icon = {
    string = icons.cpu,
    -- color = colors.low,
    padding_left = 10,
    font = {
      size = 17.0,
    },
  },
  label = {
    string = "CPU ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 12.0,
    },
    align = "right",
    padding_right = 8,
    y_offset = 0,
  },
  padding_right = 4,
})

cpu:subscribe("cpu_update", function(env)
  -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.total_load)

  local color = colors.high
  if load > 30 then
    if load < 60 then
      color = colors.mid
    elseif load < 80 then
      color = colors.mid
    else
      color = colors.low
    end
  end

  cpu:set {
    label = {
      -- string = "CPU " .. env.total_load .. "%",
      string = env.total_load .. "%",
      color = color,
    },
  }
end)

cpu:subscribe("mouse.clicked", function(env)
  sbar.exec "open -a 'Activity Monitor'"
end)
