class WalksController < ApplicationController

  get "/walks" do 
    binding.pry
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we will eventually use this method to create a list of what's permitted to be passed to .create or .update within controller actions.
  def walk_params
    
  end
end