require './item.rb'
require './items/aged_brie.rb'
require './items/legendary.rb'
require './items/regular.rb'
require './items/tickets.rb'
require './items/conjured.rb'

class GildedRose

  attr_accessor :items

  @items = []

  def initialize
    @items = []
    @items << Items::Regular.new("+5 Dexterity Vest", 10, 20)
    @items << Items::AgedBrie.new("Aged Brie", 2, 0)
    @items << Items::Regular.new("Elixir of the Mongoose", 5, 7)
    @items << Items::Legendary.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Items::Tickets.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Items::Conjured.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality

    @items.each(&:update)

    # for i in 0..(@items.size-1)

    #   #this is where the quality is changed
    #   if (@items[i].name != "Aged Brie" && @items[i].name != "Backstage passes to a TAFKAL80ETC concert")
    #     if (@items[i].quality > 0)
    #       if (@items[i].name != "Sulfuras, Hand of Ragnaros")
    #         @items[i].quality = @items[i].quality - 1
    #       end
    #     end
    #   else

    #     if (@items[i].quality < 50)
    #       @items[i].quality = @items[i].quality + 1
    #       if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
    #         if (@items[i].sell_in < 11)
    #           if (@items[i].quality < 50)
    #             @items[i].quality = @items[i].quality + 1
    #           end
    #         end
    #         if (@items[i].sell_in < 6)
    #           if (@items[i].quality < 50)
    #             @items[i].quality = @items[i].quality + 1
    #           end
    #         end
    #       end
    #     end
    #   end

    #   #this is where the sell_in date is changed
    #   if (@items[i].name != "Sulfuras, Hand of Ragnaros")
    #     @items[i].sell_in = @items[i].sell_in - 1;
    #   end

    #   #repeat?
    #   if (@items[i].sell_in < 0)
    #     if (@items[i].name != "Aged Brie")
    #       if (@items[i].name != "Backstage passes to a TAFKAL80ETC concert")
    #         if (@items[i].quality > 0)
    #           if (@items[i].name != "Sulfuras, Hand of Ragnaros")
    #             @items[i].quality = @items[i].quality - 1
    #           end
    #         end
    #       else
    #         @items[i].quality = @items[i].quality - @items[i].quality
    #       end
    #     else

    #       if (@items[i].quality < 50)
    #         @items[i].quality = @items[i].quality + 1
    #       end
    #     end
    #   end
    # end
  end
end