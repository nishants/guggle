class Application < Sinatra::Base

  get "/pages" do
    Page.all().to_json
    # halt It.works!
  end

end
