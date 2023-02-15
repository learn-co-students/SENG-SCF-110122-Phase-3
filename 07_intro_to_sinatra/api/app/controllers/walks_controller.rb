class WalksController < ApplicationController

  get "/walks" do 
    if params.include?("include_dogs")
      puts "TODO - I need to include DOGS"
      puts params
      Walk.all.to_json(include: {:dogs => {only: [:name], methods: [:age]}})
    else
      Walk.all.to_json(methods: [:formatted_time])
    end
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we will eventually use this method to create a list of what's permitted to be passed to .create or .update within controller actions.
  def walk_params
    
  end
end