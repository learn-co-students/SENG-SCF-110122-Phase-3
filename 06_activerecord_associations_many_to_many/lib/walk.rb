class Walk < ActiveRecord::Base
  # ✅✅ Refactor associations so walks and dogs are related in a many to many way
  has_many :dog_walks
  has_many :dogs, through: :dog_walks

  # ✅✅ add a #print_dogs_by_name method that returns all dog names for a particular walk

  def print_dogs_by_name 
    self.dogs.pluck(:name)
  end

  def print_dogs_by_breed 
    self.dogs.pluck(:breed)
  end

  # ✅✅ add a .recent method that returns all walks in the last 4 hours
  def self.recent
    self.where(time: 4.hours.ago..Time.now)
  end

   # call recent on Walk (or self) return all walks that meet the condition of within a time frame (4 hours)

  # takes the time of the walk and formats it as a string like this:
  # Friday, 04/08 4:57 PM
  def formatted_time
    time.strftime('%A, %m/%d %l:%M %p')
  end

  # this will display the day and time of the walk
  # and all of the dogs that were on it below
  def print
    puts ""
    puts self.formatted_time.light_green
    puts "Dogs: "
    self.dogs.each do |dog|
      puts "  #{dog.name}"
    end
    puts ""
  end
end