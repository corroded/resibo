require 'rubygems'
require 'bundler'
require 'rake'

require 'sinatra/activerecord/rake'
require './app'
Bundler.setup

Dir["tasks/*.rake"].sort.each { |ext| load ext }
