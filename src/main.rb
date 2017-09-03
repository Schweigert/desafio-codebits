require 'sinatra'
require_relative "config"
require_relative "models/fragment"

# Root
get "/" do
  "Hello"
end

# erro 404!
not_found do
  status 404
  "oops..."
end
