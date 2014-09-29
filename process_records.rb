# Record format
# Destination, What got shipped, Number of crates, Money we made

# Good news Rubyists!
# We have a week of records tracking what we shipped at Planet Express.
# I need you to answer a few questions for Hermes.

# How much money did we make this week?
# How much money did we make broken down by planet?
# ie.. how much did we make shipping to Earth? Mars? Saturn? etc.

# Also, bonuses are paid to employees who pilot the Planet Express
# Different employees have favorite destinations they always pilot to
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

# How many trips did each employee pilot?
# They get a bonus of 10% of the money for the shipment as the bonus
# How much of a bonus did each employee get?

# BONUS - uses classes for each shipment; but not necessary

require 'pry'
class Employee;
  attr_accessor :name,
                :trips,
                :bonus
  def initialize(name)
    @name = name
    @trips = 0
    @bonus = 0
  end
  def made_trip(profit)
    @trips += 1
    @bonus += profit/10
  end
  # def trips
  #   return @trips
  # end
  # def bonus
  #   return @bonus
  # end
end

class Shipment;
  attr_accessor :planet,
                :item_shipped,
                :quantity,
                :profit
  def initialize(planet, item_shipped, quantity, profit)
    @planet = planet
    @item_shipped = item_shipped
    @quantity = quantity
    @profit = profit
  end
  def show
    puts "Planet = #{@planet}"
    puts "Item shipped = #{@item_shipped}"
    puts "Quantity = #{@quantity}"
    puts "Profit = #{@profit}"
  end
  # def planet             # these methods not needed with use of attr_accessors
  #   return @planet
  # end
  # def item_shipped
  #   return @item_shipped
  # end
  # def quantity
  #   return @quantity
  # end
  # def profit
  #   return @profit
  # end
end


shipments = []

open("planet_express_logs").each do |line|
  sentence = line.chomp
  words = []
  word = ""
  sentence.chars.each do |c|
    if c != ","
      word << c
    else
      words << word
      word = ""
    end
  end
  words << word
  #p words
  shipment = Shipment.new(words[0], words[1], words[2].to_i, words[3].to_i)
#  shipment.show
  shipments << shipment
end


money_made_this_week = 0
profit_by_planet = {
  Mercury: 0,
  Earth:   0,
  Moon:    0,
  Mars:    0,
  Jupiter: 0,
  Saturn:  0,
  Uranus:  0,
  Pluto:   0,
}
fry = Employee.new("Fry")
amy = Employee.new("Amy")
bender = Employee.new("Bender")
leela = Employee.new("Leela")

shipments.each do |shipment|
  money_made_this_week += shipment.profit
  profit_by_planet[shipment.planet.to_sym] += shipment.profit
  case shipment.planet
  when "Earth"
    fry.made_trip(shipment.profit)
  when "Mars"
    amy.made_trip(shipment.profit)
  when "Uranus"
    bender.made_trip(shipment.profit)
  else
    leela.made_trip(shipment.profit)
  end


  # if shipment.planet == "Earth"
  #   fry.made_trip(shipment.profit)
  # else
  #   if shipment.planet == "Mars"
  #     amy.made_trip(shipment.profit)
  #   else
  #     if shipment.planet == "Uranus"
  #       bender.made_trip(shipment.profit)
  #     else
  #       leela.made_trip(shipment.profit)
  #     end
  #   end
  # end
end

puts "Money made this week = #{money_made_this_week}"
puts "Profit by planet:"
puts profit_by_planet
puts ""
puts "Fry made #{fry.trips} trips and made $#{fry.bonus}."
puts "Amy made #{amy.trips} trips and made $#{amy.bonus}."
puts "Bender made #{bender.trips} trips and made $#{bender.bonus}"
puts "Leela made #{leela.trips} trips and made $#{leela.bonus}"

# How much money did we make this week?
# How much money did we make broken down by planet?
# ie.. how much did we make shipping to Earth? Mars? Saturn? etc.

# Also, bonuses are paid to employees who pilot the Planet Express
# Different employees have favorite destinations they always pilot to
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

# How many trips did each employee pilot?
# They get a bonus of 10% of the money for the shipment as the bonus
# How much of a bonus did each employee get?

# BONUS - uses classes for each shipment; but not necessary
