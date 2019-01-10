require 'sinatra'
require 'sinatra/reloader'
require 'json'

get "/ping" do
  content_type :json
  data = { "result": "pong" }
  data.to_json
end
