require 'sinatra'
require 'sinatra/reloader'
require 'json'

ACCESS_TOKEN = ENV["ACCESS_TOKEN"]

post "/ping" do
  data = JSON.parse request.body.read
  text = data["events"][0]["message"]["text"]
  reply_token = data["events"][0]["replyToken"]

  if text == "ping"
    cmd = <<-HERE
    curl -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer #{ACCESS_TOKEN}" \
    -d '{"replyToken":"#{reply_token}","messages":[{"type":"text","text":"pong"}]}' \
    https://api.line.me/v2/bot/message/reply
    HERE
    system(cmd)
    p "daijobu"
  end
end
