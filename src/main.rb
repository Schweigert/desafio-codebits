require 'sinatra'
require_relative "config"
require_relative "models/fragment"

# Root
get "/" do
  erb :home
end

# erro 404!
not_found do
  status 404
  erb :e404
end
