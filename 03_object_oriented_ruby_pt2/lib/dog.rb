class Dog
  # Class methods will be defined above initialize by convention
  # and instance methods will be defined below initialize

  # ✅ We want our Dog class to store all of the Dogs we will save
  @@all = []


  # ✅ We want to be able to access the current state of the stored (saved) dogs
  def self.all
    @@all
  end 


  # ✅ We want to be able to initialize, save and return a new dog.
  def self.create(attributes)
    # do some stuff
    dog = self.new(attributes)
    # TODO instantiate a new instance and save it.
    # NOTE do this thing 
    dog.save
  end



  # ✅ We want to be able to view all dogs that need a walk
  def self.needs_walking
    self.all.filter { |dog| dog.needs_a_walk? }
  end
  
  
  # ✅ We want to be able to view all dogs that are hungry
  def self.hungry
    self.all.select do |dog| 
      dog.hungry? 
    end
  end
  


  
  attr_accessor :name, :age, :breed, :image_url, :last_walked_at, :last_fed_at, :favorite_treats, :personality

  # ✅ We want to be able to create new dog instances by passing a single collection of key-value pairs rather than a series of arguments that need to come in a particular order
  # We want to be able to create new dog instances for testing purposes without necessarily saving them within the collection of stored instances - so we won't be saving all new instances into our stored collection
  def initialize(attr = {})
    attr.each do |k, v|
      self.send("#{k}=", v)
    end
    # @name = name
    # @age = age
    # @breed = breed
    # @image_url = image_url
  end

  # ✅ We want to be able to save created instances to our stored collection after we have created them with .new
  def save
    @@all << self
    self
  end



  # we want to be able to take a dog on a walk and track when they were last walked
  def walk
    @last_walked_at = Time.now
  end

  # we want to be able to feed a dog and track when they were last fed
  def feed
    @last_fed_at = Time.now
  end

  # We want to know if a dog needs a walk. 
  # Return true if the dog hasn't been walked (that we know of) or their last walk was longer than a set amount of time in the past, otherwise return false.
  def needs_a_walk?
    if last_walked_at
      !last_walked_at.between?(6.hours.ago, Time.now)
    else
      true
    end
  end

  # We want to know if a dog is hungry.
  # Return true if the dog hasn't been fed (that we know of) or their last feeding was longer than a set amount of time in the past, otherwise return false
  def hungry?
    if last_fed_at
      !last_fed_at.between?(4.hours.ago, Time.now)
    else
      true
    end
  end

  # print details about a dog including the last walked at and last fed at times
  # ✅ We'd like to change the color of the name to indicate whether this dog needs to be walked or fed
  # Below, the private method called formatted_name will handle the logic. 
  # Call the formatted_name method within print to add the coloring
  def print
    puts
    puts  self.formatted_name
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{self.last_walked_at}"
    puts "  Last fed at: #{self.last_fed_at}"
    puts
  end

  # any methods that we intend for internal use only will be defined below the private keyword
  # helper methods that will only be used by our other instance methods in this class are good candidates for private methods
  private

  # ✅ We want to have a method that will return a formatted name with a different color depending on whether the dog needs a walk or a meal
  # The method should return the name in green if the dog has been fed and walked recently
  # The method should return their name in red along with a message in parentheses if they: need a walk, are hungry, or both

  # private method can be called on other instance methods from inside the class. 
  def formatted_name
    if self.hungry? && self.needs_a_walk?
      "#{self.name} (hungry and needs walking)".red
    elsif self.hungry?
      "#{self.name} (hungry)".yellow
    elsif self.needs_a_walk?
      "#{self.name} (needs walking)".yellow
    else
      self.name.green
    end
  end

  
end