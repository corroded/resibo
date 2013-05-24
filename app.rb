require 'rubygems'
require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require 'pry'

# Helpers
require './lib/render_partial'
require './models/receipt'

# Set Sinatra variables
set :app_file, __FILE__
set :database_file, 'config/database.yml'
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml

# Application routes
get '/' do
  @receipts = Receipt.all
  haml :index, :layout => :'layouts/application'
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end

get '/console' do
  binding.pry
end
