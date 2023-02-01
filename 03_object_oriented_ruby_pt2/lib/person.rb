#!/usr/bin/env ruby

require_relative "../config/environment"

class Person

puts self

@@all = []

def self.all
  # self => Person
  @@all
end

attr_accessor :name, :occupation, :fave_cereal, :age


def initialize(name:, age:, occupation:, fave_cereal:)
  @name = name
  @age = age
  @occupation = occupation
  @fave_cereal = fave_cereal
  @@all.push(self)
end

def initialize(attr = {}) 
  # {age: 45, occupation: "lawyer", fave_cereal: "cheerios", name: "Chris", personality_type: "shy"}
  attr.each do |key, val|
    self.send("#{key}=", val)
  end
  @@all.push(self)
end


def celebrate_bday
  # self => instance of Person
  puts "Happy bday to me!!!!!!"
  self.age += 1
end

# def name
#   @name
# end

# def age
#   @age
# end

# def name=(name)
#   @name = name
# end

def show_info
 "hi i'm #{self.name}, and i'm #{self.age}"

#  self.age doesn't need to be interpolated
end

def drive
  if self.age >= 16
    puts "vrooooom"
  else
    "...maybe next year?? 🚗"
  end
end


end

chris = Person.new({age: 45, occupation: "lawyer", fave_cereal: "cheerios", name: "Chris"})
joey = Person.new({name: "Joey", age: 15, occupation: "kid", fave_cereal: "sugar"})
# binding.pry
