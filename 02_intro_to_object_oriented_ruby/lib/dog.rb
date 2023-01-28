class Dog
  # ✅ we should be able to create dogs with a name, age, breed, and image_url
  def initialize(name, age, breed, image_url = nil, last_fed_at = nil, last_walked_at = nil, favorite_treats = nil)
    @name = name
    @age = age
    @breed = breed
    @image_url = image_url
    @last_fed_at = last_fed_at
    @last_walked_at = last_walked_at
    @favorite_treats = favorite_treats
  end

  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at, :favorite_treats

  # attr_reader => getter
  # attr_writer => setter

  # attr_accessor => both

  # puts @name

  # # getter
  # def name
  #   @name
  # end

  # # setter
  # def name=(name)
  #   @name = name
  # end
  # ✅ we want to be able to access a dog's last_fed_at and last_walked at times

  # ✅ we also want to be able to access the dog's favorite_treats

  # ✅ we want to be able to take a dog on a walk and track when they were last walked
  def walk
    @last_walked_at = Time.now
  end

  # ✅ we want to be able to feed a dog and track when they were last fed
  def feed
    @last_fed_at = Time.now
  end

  # ✅ we want to be able to check if a dog needs a walk (hasn't been walked in the last 4 hours)
  def needs_a_walk?
    # need to handle if the dog has never been walked
    if @last_walked_at
      !(@last_walked_at.between?(4.hours.ago, Time.now))
    else
      true
    end
  end

  # ✅ we want to be able to check if a dog is hungry (hasn't been fed in the last 6 hours)
  def hungry?
    # need to handle if the dog has never been fed
    if @last_fed_at
      !(@last_fed_at.between?(6.hours.ago, Time.now))
    else
      true
    end
  end

  # ✅ we want to be able to print details about a dog (this time including the last walked at and last fed at times)
  def print
    puts
  puts self.name.green
  puts "  Age: #{self.age}"
  puts "  Breed: #{self.breed}"
  puts "  Image Url: #{self.image_url}"
  puts "  Last Walked At: #{self.last_walked_at}"
  puts "  Last Fed At: #{self.last_fed_at}"
  puts
  end

end