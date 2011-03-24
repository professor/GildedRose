class Item

  attr_accessor :name, :sellIn, :quality

  def initialize (name, sellIn, quality)
    @name = name
    @sellIn = sellIn
    @quality = quality
  end


end