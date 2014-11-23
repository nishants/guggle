require 'sinatra'
require 'active_record'

#load configurations
require File.expand_path(File.dirname(__FILE__) + '/config/config')

Dir.glob("./lib/**/*.rb"){|f| require f }

class Application < Sinatra::Base
  
  get "/" do
    Page.all().to_json
    # halt It.works!
  end
  
end
