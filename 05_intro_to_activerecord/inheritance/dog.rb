class Dog


  attr_accessor :name, :breed

  def initialize(name:, breed:)
    @name = name
    @breed = breed
  end

  def bark
    puts "rufffff"
  end


  def eat
    puts "nom nom nom"
  end


end