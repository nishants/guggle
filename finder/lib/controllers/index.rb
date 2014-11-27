class Application < Sinatra::Base

  get "/pages" do
    Search.by_query(params[:query], Page.all).to_json
  end

end