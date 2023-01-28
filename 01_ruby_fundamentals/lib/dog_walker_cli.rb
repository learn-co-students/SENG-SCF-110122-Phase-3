def start_cli
  puts "Hi there! Welcome to the Dog Walker CLI!".cyan
end



# define a method `print_menu_options` which outlines the user's
# choices. The choices will be displayed as a numbered list like so:
#   1. List all dogs
#   2. Add a dog
# At any time, type "menu" to see these options again or "exit" to
# leave the program

def print_menu_options
  puts "  1. List all dogs"
  puts "  2. Add a dog"
  puts "  At any time, type 'menu' to see these options again or 'exit' to leave the program"
end



# define a method `ask_for_choice` which prompts the user for input
# if the user types "exit" we'll print a message thanking them
# for using the CLI and invoke to terminate the program
# otherwise, return whatever the user typed in
def ask_for_input
  input = gets.chomp
  # if input is exit, we want to exit. don't want input = "exit"
  if input == "exit"
    puts "That was fast. Thanks for playing, please come back soon."
    exit
  end
  input
end


# define a `print_dog` method that accepts a dog hash as a parameter
# and prints out the dog's details that looks like this:
=begin
  
Lennon Snow
  Age: Almost 2
  Breed: Pomeranian
  Image URL: https://res.cloudinary.com/dnocv6uwb/image/upload/v1609370267/dakota-and-lennon-square-compressed_hoenfo.jpg

=end
def print_dog(dog_hash)
  puts
  puts dog_hash[:name].blue
  puts "  Age: #{dog_hash[:age]}"
  puts "  Breed: #{dog_hash[:breed]}"
  puts "  Image URL: #{dog_hash[:image_url]}"
  puts
end



# define a method `list_dogs` that will iterate over an array of
# dog hashes and call print_dog on each one.
def list_dogs(dog_arr)
  dog_arr.each do |dog_hash|
  print_dog(dog_hash)
  end
end


# define an `add_dog` method which accepts an array of dog
# hashes as an argument. It should:
# ask the user for input of the
# dog's name, age, breed and image_url. 
# Take this information and put it into a hash
# add the hash to the dogs array passed as an argument
# print the newly added dog
def add_dog(dogs_arr)
  print "What is the dog's name? "
  name = ask_for_input
  print "What is the dog's age? "
  age = ask_for_input
  print "What is the dog's breed? "
  breed = ask_for_input
  print "What is the dog's image_url? "
  image_url = ask_for_input
  dog_hash = {
    name: name,
    age: age,
    breed: breed,
    image_url: image_url
  }
  dogs_arr << dog_hash
end


# define a method `handle_choice` which will take a `choice` as a 
# parameter and handle it in the appropriate way based on the menu
# option that was chosen
def handle_choice(choice)
  if choice == "1"
    list_dogs($dogs)
  elsif choice == "2"
    add_dog($dogs)
  elsif choice == "debug"
    binding.pry
  else puts "ummmm we don't compute. Please try your answer again.".red
  end
end


