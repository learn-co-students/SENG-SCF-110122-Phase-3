class DogsController < ApplicationController
  
  get "/dogs" do 
    check_for_include_dog_walks(Dog.all)
  end

  get "/dogs/:id" do 
    dog = Dog.find(params[:id])
    check_for_include_dog_walks(dog)
  end

  # ✅ we want to be able to create dogs through the API
  post "/dogs" do
    dog = Dog.create(dog_params)
    dog.to_json
  end

  # def initialize(attributes = {})
  #   attributes.each do |attr, value|
  #     self.send("#{attr}=", value)
  #   end
  # end

  # Dog.create(name: name, breed: breed, .......)

  # ✅ we want to be able to update dogs through the API
  patch "/dogs/:id" do
    dog = Dog.find(params[:id])
    dog.update(dog_params)
    check_for_include_dog_walks(dog)
  end

  # ✅ we want to be able to delete dogs through the API
  delete "/dogs/:id" do
    dog = Dog.find(params[:id])
    dog.destroy
    # dog.to_json
    status 204
  end

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