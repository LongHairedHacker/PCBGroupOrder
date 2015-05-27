local boards = require 'boards'
local extents = require 'boards.extents'
local manipulation = require 'boards.manipulation'
local panelization = require 'boards.panelization'

local mm = 1e9

local sss7 = boards.load('./boards/sss7modem/sss7modem')

local layout = {
	{sss7},
	{sss7},
}

local panel = panelization.panelize(layout, {}, true)

boards.merge_apertures(panel)
boards.save(panel, './panel/panel')
