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
  print(self.name .. " requested to walk " .. direction .. ".")
  if direction == "up" then
    self.socket:send("wu\n")
  elseif direction == "down" then
    self.socket:send("wd\n")
  elseif direction == "left" then
    self.socket:send("wl\n")
  elseif direction == "right" then
    self.socket:send("wr\n")
  end
  local response = self.socket:receive()
  local results = tonumber(msg)
  return results
end

return CHaserConnect