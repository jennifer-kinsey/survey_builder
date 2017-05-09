require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("./lib/answer")
require("pg")
require ("pry")

get('/') do
  erb(:index)
end
