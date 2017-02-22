require 'sinatra'
require 'ffaker'

get '/lorem/:type' do
  case :type
  when 'standard', 'ipsum'
    FFaker::Lipsum.paragraphs(3)
  end
end

get '/:name' do
  ':name, we welcome you. Join us. Leave all aseity behind. Be one with the Oneness in which all is naught.'
end

get '/' do
  'Welcome!'
end
