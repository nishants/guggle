require 'yaml'
require 'sinatra'
require 'active_record'

Dir.glob("./lib/application/**.rb"){|f| require f }

# database settings
ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "mysql",
  :database => "guggle"
)

Dir[File.join(File.dirname(__FILE__), 'lib', 'models/**/*.rb')].each do |filename|
  autoload File.basename(filename, '.rb').camelize.to_sym, filename
end

# create a model
class Page < ActiveRecord::Base
end

class Application < Sinatra::Base
  
  get "/" do
    Page.all().to_json
    # halt It.works!
  end
  
end
