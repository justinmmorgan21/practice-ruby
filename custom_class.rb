# Rewrite your store items using a class instead of a hash.
# a) Choose which attributes should have “reader” methods and which attributes should have “writer” methods.
# b) Create an instance from your store item class. Use puts statements to print the 3 attributes individually to the terminal.
# c) Use the attr_writer method to change a value
class LegoSet
  def initialize(design, price, diff)
    @design = design
    @price = price
    @difficulty = diff
  end

  

end

lego_set1 = LegoSet.new("truck", 30, "medium")
lego_set2 = LegoSet.new("skyscraper", 50, "hard")
lego_set3 = LegoSet.new("jet ski", 20, "easy")
lego_sets = [lego_set1, lego_set2, lego_set3]
pp lego_sets