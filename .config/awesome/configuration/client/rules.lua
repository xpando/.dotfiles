local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  -- Web
  {
    rule_any = { class = {'Google-chrome','Brave-browser','firefox'}},
    properties = { tag = "1", switch_to_tags = true }
  },
  -- Dev Tools
  {
    rule_any = { class = {'Code','jetbrains-idea'}},
    properties = { tag = "2", switch_to_tags = true }
  },
  -- Chat
  {
    rule_any = { class = {'Slack'}},
    properties = { tag = "3", switch_to_tags = true }
  },
  -- Media
  
  -- Dialogs
  {
    rule_any = {type = {'dialog'}, class = {'Pavucontrol','Wicd-client.py','calendar.google.com'}},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  }
}
