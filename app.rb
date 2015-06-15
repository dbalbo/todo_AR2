require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pg')


get('/') do

  @lists = List.all()
  erb(:index)
end

post('/lists') do
  name = params.fetch('name')
  @list = List.create(:name => name)
  redirect back
end


get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i)
  erb(:list)
end


post('/tasks') do
  description = params.fetch('description')
  list_id = params.fetch('list_id')
  @task = Task.create({:description => description, :list_id => list_id})
  @list = List.find(params.fetch('list_id').to_i)
  erb(:list)
end


get('/:id/edit') do
  @task = Task.find(params.fetch("id").to_i)
  erb(:task_edit)
end

patch('/edit/:id') do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i)
  @task.update({:description => description})

  @list = List.find(@task.list())

  erb(:list)
end
