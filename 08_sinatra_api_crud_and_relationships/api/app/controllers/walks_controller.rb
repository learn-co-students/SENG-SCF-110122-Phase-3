class WalksController < ApplicationController

  get "/walks" do 
    check_for_include_dogs(Walk.all)
  end


  get "/walks/:id" do 
    walk = Walk.find(params[:id])
    check_for_include_dogs(walk)
  end

 
  # ✅ we want to be able to create walks through the API
  post "/walks" do 
    walk = Walk.create(walk_params)
    check_for_include_dogs(walk)
  end

  # ✅ we want to be able to update walks through the API
  patch "/walks/:id" do 
    walk = Walk.find(params[:id])
    walk.update(walk_params)
    check_for_include_dogs(walk)
  end

  # ✅ we want to be able to delete walks through the API
  delete "/walks/:id" do 
   walk = Walk.find(params[:id])
   walk.destroy
   status 204
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def walk_params
    allowed_params = %w(time dog_ids)
    # ["time", "dog_ids"]
    params.select {|param,value| allowed_params.include?(param)}
  end
  
  def check_for_include_dogs(walk_or_walks)
    if params.include?("include_dogs")
      walk_or_walks.to_json(methods: [:formatted_time], except: [:created_at, :updated_at], include: {:dogs => {methods: [:age], only: [:name, :breed, :id]}})
    else 
      walk_or_walks.to_json(methods: [:formatted_time], except: [:created_at, :updated_at])
    end
  end

end