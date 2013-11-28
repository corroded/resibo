require 'rubygems'
require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require 'pry'
require 'csv'

# Helpers
require './lib/render_partial'
require './lib/prettify_date'
require './lib/generate_csv'
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
  @receipt = Receipt.new

  haml :index, :layout => :'layouts/application'
end

# Receipts
post '/receipts' do
  params[:receipt][:receipt_date] = Date.parse "#{Time.now.year}-#{Time.now.month}-#{params[:receipt][:receipt_date]}"
  @receipt = Receipt.new params[:receipt]
  if @receipt.save
    redirect '/'
  else
    'There was a problem saving the receipt...'
  end
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end

get '/console' do
  binding.pry
end

get '/generate' do
  generate_csv
  send_file 'receipts.csv'
end
