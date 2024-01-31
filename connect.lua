-- Load luasockets
local socket = require("socket")

-- Class
CHaserConnect = {}
CHaserConnect.__index = CHaserConnect

function CHaserConnect:Init()
  -- io ip
  print("Please input the IP address:")
  self.ip = io.read()
  -- io port
  print("Please input the port number:")
  self.port = io.read()
  -- io name
  print("What is your name?")
  self.name = io.read()

  -- create tcp socket
  self.socket = socket.tcp()
  -- connect
  self.socket:connect(self.ip, self.port)

  if self.socket then
    print("Connection established!")
  else
    print("Connection failed!")
  end

  -- set timeout
  self.socket:settimeout(0.1)

  -- create instance
  local instance = {}
  setmetatable(instance, CHaserConnect)
  return instance
end

function CHaserConnect:InitSocket()
  -- send name
  self.socket:send(self.name .. "\n")
end

function CHaserConnect:GetReady()
  -- send ready
  self.socket:send("gr\n")
end

function CHaserConnect:Walk(direction)
  local directions = {
    up = "wu\n",
    down = "wd\n",
    left = "wl\n",
    right = "wr\n"
  }
  local formattedDirection = directions[direction]
  if formattedDirection then
    self.socket:send(formattedDirection)
  end
end

return CHaserConnect