class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # method "URL" do
    
  # end
  get "/hi" do 
    binding.pry
    { hello: "world" }.to_json
  end

end
