class Dog < ActiveRecord::Base

  has_many :feedings
  has_many :walks


  # Class methods will be defined above initialize by convention
  # and instance methods will be defined below initialize

  # ✅ Because we'll be inheriting from ActiveRecord::Base now, some of these methods will be defined in the Base class for us, so we can remove them from the Dog class:
  # We can remove the following:
  
  # --- @@all
  # --- def self.all
  # --- def self.new_from_row
  # --- def self.create
  # --- all attr_accessors & attr_reader
  # --- def initialize 
  # --- def save

  # We'll want to leave our custom methods that work with instances within the CLI, but all of the code related to persistence can be removed as we'll be using the versions of those methods defined in the ActiveRecord::Base class instead.


  # Begin ❌❌❌❌❌
  
  # End ❌❌❌❌❌

  # return all of the dogs who are hungry
  def self.hungry
    self.all.filter do |dog|
      dog.hungry?
    end
  end
  
  # return all of the dogs who need a walk
  def self.needs_walking
    self.all.filter do |dog|
      dog.needs_a_walk?
    end
  end
  
  # Begin ❌❌❌❌❌

  
  # End ❌❌❌❌❌

  # the age method calculates a dog's age based on their birthdate
  def age
    return nil if self.birthdate.nil?
    # binding.pry
    days_old = (Date.today - self.birthdate).to_i.days
    if days_old < 30.days
      weeks_old = days_old.in_weeks.floor
      "#{weeks_old} #{'week'.pluralize(weeks_old)}"
    elsif days_old < 365.days
      months_old = days_old.in_months.floor
      "#{months_old} #{'month'.pluralize(months_old)}"
    else
      years_old = days_old.in_years.floor
      "#{years_old} #{'year'.pluralize(years_old)}"
    end
  end

# ✅ We need to update #walk to create a new walk and also invoke the self.last_walked_at method to update our @last_walked_at in the db

  # we want to be able to take a dog on a walk and track when they were last walked
  def walk
    time = Time.now
    self.update(last_walked_at: time)
    self.walks.create(time: time)
  end

# ✅ We need to update #feed to create a new feeding and also invoke the self.last_fed_at method to update our @last_fed_at in the db

  # we want to be able to feed a dog and track when they were last fed
  def feed
    time = Time.now
    self.update(last_fed_at: time)
    self.feedings.create(time: time)
  end

  # We want to know if a dog needs a walk. 
  # Return true if the dog hasn't been walked (that we know of) or their last walk was longer than a set amount of time in the past, otherwise return false.
  def needs_a_walk?
    if last_walked_at
      !last_walked_at.between?(4.hours.ago, Time.now)
    else
      true
    end
  end

  # We want to know if a dog is hungry.
  # Return true if the dog hasn't been fed (that we know of) or their last feeding was longer than a set amount of time in the past, otherwise return false
  def hungry?
    if last_fed_at
      !last_fed_at.between?(6.hours.ago, Time.now)
    else
      true
    end
  end

  # print details about a dog including the last walked at and last fed at times
  def print
    puts
    puts self.formatted_name
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{format_time(self.last_walked_at)}"
    puts "  Last fed at: #{format_time(self.last_fed_at)}"
    puts
  end

  # any methods that we intend for internal use only will be defined below the private keyword
  # helper methods that will only be used by our other instance methods in this class are good candidates for private methods
  private

  # formatted_name
  # The method should return the name in green if the dog has been fed and walked recently
  # The method should return their name in red along with a message in parentheses if they: need a walk, are hungry, or both
  def formatted_name
    if self.hungry? && self.needs_a_walk?
      "#{self.name} (hungry and in need of a walk!)".red
    elsif self.hungry?
      "#{self.name} (hungry)".red
    elsif self.needs_a_walk?
      "#{self.name} (needs a walk)".red
    else
      self.name.green
    end
  end

  def format_time(time)
    time && time.strftime('%Y-%m-%d %H:%M:%S')
  end
  
end