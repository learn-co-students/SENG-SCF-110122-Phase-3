class Walk < ActiveRecord::Base
  has_many :dog_walks, dependent: :destroy
  has_many :dogs, through: :dog_walks


  def formatted_time
    time.strftime("%A, %m/%d/%y %l:%M %p")
  end
end