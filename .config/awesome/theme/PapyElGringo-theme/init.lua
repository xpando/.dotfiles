local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.blue
--theme.primary.hue_500 = '#0e0e0ecc'
theme.primary.hue_500 = '#003f6b'

-- Accent
theme.accent = mat_colors.cyan

-- Background
theme.background = mat_colors.blue_grey
-- theme.background.hue_800 = '#0e0e0ecc'
-- theme.background.hue_900 = '#1c1c1ccc'
theme.background.hue_800 = '#192933'
theme.background.hue_900 = '#121e25'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
