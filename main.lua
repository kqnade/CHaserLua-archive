local CHaserConnect = require("connect")
local socket = require("socket")

-- Create instance
local chaser = CHaserConnect:Init()
chaser:InitSocket()

chaser:GetReady()

chaser:Walk("up")
chaser:Walk("down")
chaser:Walk("left")
chaser:Walk("right")

chaser:Look("up")
chaser:Look("down")
chaser:Look("left")
chaser:Look("right")
