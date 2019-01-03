require 'sinatra'
require 'sinatra/reloader'
require 'erb'

get "/ping" do
  erb :index
end
