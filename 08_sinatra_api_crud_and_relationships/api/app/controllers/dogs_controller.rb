class DogsController < ApplicationController
  
  get "/dogs" do 
    check_for_include_dog_walks(Dog.all)
  end

  get "/dogs/:id" do 
    dog = Dog.find(params[:id])
    check_for_include_dog_walks(dog)
  end

  # ✅ we want to be able to create dogs through the API

  

  # ✅ we want to be able to update dogs through the API
  

  # ✅ we want to be able to delete dogs through the API
  

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def dog_params
    allowed_params = ["name", "birthdate", "breed", "image_url"]
   # orrrrr => allowed_params = %w(name birthdate breed image_url)
    params.select {|param,value| allowed_params.include?(param)}
  end

  def check_for_include_dog_walks(dog_or_dogs)
    if params.include?("include_walks")
      dog_or_dogs.to_json(methods: [:age], include: {:dog_walks => {methods: [:formatted_time], only: [:pooped]}})
    else 
      dog_or_dogs.to_json(methods: [:age])
    end
  end

  
end