require 'yaml'

def db_config_for(environment)
	_properties_for(environment)["db"]
end

def rack_env
	ENV['RACK_ENV']
end

def _properties_for(environment)
	_read_yaml_from(_properties_file)[environment]
end

def _properties_file
	File.expand_path(File.dirname(__FILE__) + '/properties.yaml')
end

def _read_yaml_from(file)
	YAML.load_file(file)
end