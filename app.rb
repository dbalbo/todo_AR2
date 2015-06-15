require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pg')


get('/') do
  erb(:index)
end
