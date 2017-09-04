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

# Post Fragment
post "/edit/:id" do
  erb :edit, :locals => {:id => params["id"], :name => params["name"], :source => params["source"]}
end

# erro 404!
not_found do
  status 404
  erb :e404
end
