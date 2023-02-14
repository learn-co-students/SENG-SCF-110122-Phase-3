class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # method "URL" do
    
  # end
  get "/" do 
    "Welcome to Sinatra!!!!!"
  end

end
