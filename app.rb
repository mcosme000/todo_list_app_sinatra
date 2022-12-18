require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'tasks.sqlite3' }
# or set :database_file, "path/to/database.yml"
# El nombre de la DB cuando la creo con rake db:create
# es el nombre que aparece arriba ("foo.sqlite3")

class Task < ActiveRecord::Base
end

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get '/' do
  @tasks = Task.all
  erb :tasks
end

post '/tasks' do
  task = Task.new(name: params[:name], description: params[:description], completed: false)
  task.save

  redirect to('/')
end

get '/delete-task' do
  erb :delete_task
end
