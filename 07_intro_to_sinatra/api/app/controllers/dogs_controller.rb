class DogsController < ApplicationController
  
 
  # method name (http verb), route / path / endpoint, code block
  get "/dogs" do
    Dog.all.to_json(only: [:name, :breed], methods: [:age], include: :dog_walks)
  end

  get "/dogs/:id" do
    dog = Dog.find(params[:id])
    dog.to_json
  end





  private 
  # a method used to specify which keys are allowed through params into the controller
  # we will eventually use this method to create a list of what's permitted to be passed to .create or .update within controller actions.
  def dog_params
    
  end

end