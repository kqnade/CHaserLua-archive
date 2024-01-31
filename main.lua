local CHaserConnect = require("connect")
local socket = require("socket")

-- Create instance
local chaser = CHaserConnect:Init()
chaser:InitSocket()

while true do
  chaser:GetReady()
end