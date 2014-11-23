def configure_db()
	ActiveRecord::Base.establish_connection(
	  :adapter  => "mysql2",
	  :host     => "localhost",
	  :username => "root",
	  :password => "mysql",
	  :database => "guggle"
	)
end

configure_db()
