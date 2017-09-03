require 'sinatra'
require_relative "config"
require_relative "models/fragment"

# Root
get "/" do
  erb :home
end

# Create Fragment
post "/create/" do
  puts params.to_s
  erb :create, :locals => {:name => params["name"], :source => params["source"]}
end

# erro 404!
not_found do
  status 404
  erb :e404
end
