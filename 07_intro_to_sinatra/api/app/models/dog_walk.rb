class DogWalk < ActiveRecord::Base
  belongs_to :dog
  belongs_to :walk

  scope :with_poop, -> { where(pooped: true) }

# delegate literally delegates the method. When .formatted_time is called on a DogWalk instance, we are telling Ruby to call the method on the corresponding walk not the dog_walk. (There is no .time in a DogWalk instance.)
  delegate :formatted_time, to: :walk

  
end