local boards = require 'boards'
local extents = require 'boards.extents'
local manipulation = require 'boards.manipulation'
local panelization = require 'boards.panelization'
local extents = require 'boards.extents'

local mm = 1e9

local sss7 = boards.load('./boards/sss7modem/sss7modem')

local sss7_extends = extents.compute_board_extents(sss7)

local filler = panelization.empty_board(10*mm, sss7_extends.height * 2 + 2*mm) 

local panel = panelization.panelize({filler, {sss7, sss7}}, {}, false)

boards.merge_apertures(panel)
boards.save(panel, './panel/panel')
