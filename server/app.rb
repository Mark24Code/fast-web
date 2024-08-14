require "sinatra"

class App < Sinatra::Base
  get "/" do
    send_file "./public/index.html"
  end

  get "*" do
    "404"
  end
end
