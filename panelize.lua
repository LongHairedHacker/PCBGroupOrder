local boards = require 'boards'
local extents = require 'boards.extents'
local manipulation = require 'boards.manipulation'
local panelization = require 'boards.panelization'

local mm = 1e9

local simple = boards.load('./boards/simple/simple')

local simple_extents = extents.compute_board_extents(simple)
local height = simple_extents.height
local width = simple_extents.width + 24*mm
local tabv = panelization.empty_board(10*mm, height)
local tabh = panelization.empty_board(width, 10*mm)

local layout = {
	tabh,
	{ tabv, simple, tabv },
	tabh,
}

local panel = panelization.panelize(layout, {}, true)

boards.merge_apertures(panel)
boards.save(panel, './panel/panel')
