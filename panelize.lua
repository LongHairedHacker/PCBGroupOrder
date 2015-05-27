local boards = require 'boards'
local extents = require 'boards.extents'
local manipulation = require 'boards.manipulation'
local panelization = require 'boards.panelization'

local mm = 1e9

local simple = boards.load('./boards/simple/simple')

local layout = {
	{simple, simple},
	{simple, simple},
}

local panel = panelization.panelize(layout, {}, true)

boards.merge_apertures(panel)
boards.save(panel, './panel/panel')
