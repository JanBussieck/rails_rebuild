require_relative 'test_helper'

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

def app 
  TestApp.new
end

class TestController < Rulers::Controller
  def index
    "Hello!" #N or rendering a view
  end
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def test_request
    get "/example/route"
    
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end
  
end