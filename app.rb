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
