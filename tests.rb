require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal Filler.welcome, last_response.body
  end

  def test_names_page
    name = Filler.new_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal Filler.welcome(name), last_response.body
  end

  def test_lipsums_page
    get '/lorem/standard'
    assert last_response.ok?
    assert_equal Filler.lipsum, last_response.body
  end


end
