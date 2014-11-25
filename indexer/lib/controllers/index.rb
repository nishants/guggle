class Application < Sinatra::Base

  post "/pages" do
    Page.new(params).save
  end

end
