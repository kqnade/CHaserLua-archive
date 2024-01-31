-- Load luasockets
local socket = require("socket")

-- Class
CHaserConnect = {}
CHaserConnect.__index = CHaserConnect

function CHaserConnect:New()
  local self = setmetatable({}, CHaserConnect)
  self.name = name
  self.socket = nil
  return self
end

function CHaserConnect:init(name)
  self.name = name
  
  -- io ip
  print("Please input ip address")
  local ip = io.read()
  -- io port
  print("Please input port number")
  local port = io.read()

  -- connect
  self.socket = socket.connect(ip, port)
  print("Connecting to " .. ip .. ":" .. port .. " ...")
  if self.socket == nil then
    print("Connection failed")
    return
  end

  -- send name
  self.socket:send(name .. "\n")
  print("Connected")
end

function CHaserConnect:send(str)
  self.socket:send(str .. "\n")
end
