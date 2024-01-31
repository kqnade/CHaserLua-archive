local CHaserConnect = require("connect")
local socket = require("socket")

-- Create instance
local chaser = CHaserConnect:Init()
chaser:InitSocket()

chaser:GetReady()

while true do
  chaser:GetReady()
end