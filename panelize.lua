local boards = require 'boards'
local extents = require 'boards.extents'
local manipulation = require 'boards.manipulation'
local panelization = require 'boards.panelization'
local extents = require 'boards.extents'

local mm = 1e9

local sss7 = boards.load('./boards/sss7modem/sss7modem')
local driver = boards.load('./boards/leddriver/leddriver')


local sss7_extends = extents.compute_board_extents(sss7)
local driver_extends = extents.compute_board_extents(driver)

local filler = panelization.empty_board(driver_extends.width, sss7_extends.height * 2 - driver_extends.height)

local panel = panelization.panelize({{sss7, sss7}, {filler, driver}}, {}, false)

boards.merge_apertures(panel)

local panel_extends = extents.compute_board_extents(panel)

print("Current panel width:" .. panel_extends.width / mm .. "mm")
print("Current panel height:" .. panel_extends.height / mm .. "mm")

local filler_extends = extents.compute_board_extents(filler)

print("Current filler width:" .. filler_extends.width / mm .. "mm")
print("Current filler height:" .. filler_extends.height / mm .. "mm")

boards.save(panel, './panel/panel')
