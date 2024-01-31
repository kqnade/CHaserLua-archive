local socket = require("socket")

local server = socket.bind("localhost", 1234) -- Replace "localhost" with your desired IP address
print("Server started, waiting for connections...")

while true do
  local client = server:accept()
  print("New connection established!")

  -- Handle the client connection
  while true do
    local message, err = client:receive()
    if err then
      print("Connection closed by client.")
      break
    end

    -- Process the received message
    print("Received message: " .. message)

    -- Send a response back to the client
    local response = "Server received: " .. message
    client:send(response .. "\n")

    -- Check if the client wants to close the connection
    if message == "quit" then
      print("Client requested to close the connection.")
      break
    elseif message == "wu\n" then
      print("Client requested to walk up.")
      response = "Server received: " .. message
      client:send(response .. "\n")
    elseif message == "wd\n" then
      print("Client requested to walk down.")
      response = "Server received: " .. message
      client:send(response .. "\n")
    elseif message == "wl\n" then
      print("Client requested to walk left.")
      response = "Server received: " .. message
      client:send(response .. "\n")
    elseif message == "wr\n" then
      print("Client requested to walk right.")
      response = "Server received: " .. message
      client:send(response .. "\n")
    end
  end

  -- Close the client connection
  client:close()
  print("Connection closed.")
end