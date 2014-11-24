require 'sinatra'
require 'active_record'

#load configurations
require File.expand_path(File.dirname(__FILE__) + '/config/config')

# Include all source code files from root/lib/*
Dir.glob("./lib/**/*.rb"){|f| require f }

def setup_db_with(db_config)
  ActiveRecord::Base.establish_connection(
      :adapter  => db_config["adapter"],
      :host     => db_config["host"],
      :username => db_config["user"],
      :password => db_config["password"],
      :database => db_config["name"]
  )
end

setup_db_with(db_config_for(rack_env()))
