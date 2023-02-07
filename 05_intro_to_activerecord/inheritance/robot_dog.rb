require_relative "./dog"
require "pry"

class RobotDog < Dog
  
end

roomba = RobotDog.new({name: "roomba", breed: "i-robot"})

binding.pry