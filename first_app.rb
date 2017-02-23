#!/usr/bin/env ruby
require 'sinatra'
require './filler'

get '/lorem/:type' do
  case params['type'].downcase
  when 'standard', 'ipsum'
    Filler.lipsum
  end
end

get '/:name' do
  Filler.welcome(params['name'])
end

get '/' do
  Filler.welcome
end
