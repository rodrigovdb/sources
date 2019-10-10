require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/namespace' # From sinatra-contrib

require 'models'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, 'app/views'

  before do
    content_type 'application/json'
  end

  get '/health' do
    { status: :ok }.to_json
  end

  get '/view' do
    content_type 'text/html'
    erb :login
  end
end
