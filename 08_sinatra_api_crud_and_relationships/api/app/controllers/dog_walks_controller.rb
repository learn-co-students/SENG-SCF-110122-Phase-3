class DogWalksController < ApplicationController
  
  # ✅✅ we don't need to create dog_walks through the API because this is done via walks

  # ✅ we want to be able to update dog_walks through the API to update pooped. But if we wanted to update the time of the walk as well we could do that from here! Thru an additional custom method we will write in the DogWalk model.
  patch "/dog_walks/:id" do
    dog_walk = DogWalk.find(params[:id])
    dog_walk.update(dog_walk_params)
    dog_walk.to_json
  end

  # ✅ we want to be able to delete dog_walks through the API (altho this is also done via walks)
  # perhaps deleting dog_walk would be done by the actual dog owner client, and the deleting via walks would happen from an administrator
  delete "/dog_walks/:id" do
    dog_walk = DogWalk.find(params[:id])
    dog_walk.destroy
    status 204
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def dog_walk_params
    allowed_params = %w(dog_id walk_time pooped)
    params.select {|param,value| allowed_params.include?(param)}
  end

  def get_dog_walk_json_config()
    {
      methods: [:formatted_time]
    }
  end
  
end