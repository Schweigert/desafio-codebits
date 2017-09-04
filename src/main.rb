require 'sinatra'
require_relative "config"
require_relative "models/fragment"

# Root
get "/" do
  erb :home
end

# Create Fragment
post "/create/" do
  erb :create, :locals => {:name => params["name"], :source => params["source"]}
end

# View Fragment
get "/view/:id" do
  erb :view, :locals => {:id => params["id"]}
end

# Edit Fragment
get "/editor/:id" do
  erb :editor, :locals => {:id => params["id"]}
end

# Purge Fragment
get "/purge/:id" do
  erb :purge, :locals => {:id => params["id"]}
end

# erro 404!
not_found do
  status 404
  erb :e404
end
