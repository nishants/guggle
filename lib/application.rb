require 'yaml'
require 'sinatra'


Dir.glob("./lib/application/**.rb"){|f| require f }

class Application < Sinatra::Base
  
  get "/" do
    halt It.works!
  end
  
end
