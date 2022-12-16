require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'coffee.sqlite3' }
# or set :database_file, "path/to/database.yml"
# El nombre de la DB cuando la creo con rake db:create
# es el nombre que aparece arriba ("foo.sqlite3")


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get '/' do
  erb :tasks
end

get '/add-task' do
  erb :add_task
end

get '/delete-task' do
  erb :delete_task
end
