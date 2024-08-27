# Rewrite your store items using a class instead of a hash.
# a) Choose which attributes should have “reader” methods and which attributes should have “writer” methods.
# b) Create an instance from your store item class. Use puts statements to print the 3 attributes individually to the terminal.
# c) Use the attr_writer method to change a value
class LegoSet
  attr_writer :price
  attr_reader :design, :price, :difficulty

  def initialize(design, price, diff)
    @design = design
    @price = price
    @difficulty = diff
  end

  def to_s
    "#{@design} lego set, on sale for $#{@price}, has a #{@difficulty} difficulty rating"
  end

end

lego_set1 = LegoSet.new("truck", 30, "medium")
lego_set2 = LegoSet.new("skyscraper", 50, "hard")
lego_set3 = LegoSet.new("jet ski", 20, "easy")
lego_sets = [lego_set1, lego_set2, lego_set3]
lego_sets.each { |set|
  pp set.design
  pp set.price
  pp set.difficulty
}
puts lego_set1
lego_set1.price += 10
puts lego_set1