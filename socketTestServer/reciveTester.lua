local socket = require("socket")

local server = socket.bind("localhost", 12345)  -- ローカルホストのポート12345で接続を待機

while true do
  local client = server:accept()  -- クライアントからの接続を待機
  local line, err = client:receive()  -- クライアントからのデータを受信
  
  if line then
    print("Received data: " .. line)
  elseif err == "closed" then
    break  -- クライアントが接続を切断した場合はループを終了
  else
    print("Error: " .. err)
    break
  end
  
  client:close()  -- クライアントとの接続を閉じる
end

server:close()  -- サーバの接続を閉じる