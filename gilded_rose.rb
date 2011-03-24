require './item.rb'

class GildedRose

  @items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality

    for i in 0..(@items.size-1)
      if ((!"Aged Brie".eql?(@items[i].name)) && !"Backstage passes to a TAFKAL80ETC concert".eql?(@items[i].name))
        if (@items[i].quality > 0)
          if (!"Sulfuras, Hand of Ragnaros".eql?(@items[i].name))
            @items[i].quality = @items[i].quality - 1
          end
        end
      else
        if (@items[i].quality < 50)
          @items[i].quality = @items[i].quality + 1

          if ("Backstage passes to a TAFKAL80ETC concert".eql?(@items[i].name))
            if (@items[i].sell_in < 11)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end

            if (@items[i].sell_in < 6)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
          end
        end
      end

      if (!"Sulfuras, Hand of Ragnaros".eql?(@items[i].name))
        @items[i].sell_in = @items[i].sell_in - 1
      end

      if (@items[i].sell_in < 0)
        if (!"Aged Brie".eql?(@items[i].name))
          if (!"Backstage passes to a TAFKAL80ETC concert".eql?(@items[i].name))
            if (@items[i].quality > 0)
              if (!"Sulfuras, Hand of Ragnaros".eql?(@items[i].name))
                @items[i].quality = @items[i].quality - 1
              end
            end
          else
            @items[i].quality = @items[i].quality - @items[i].quality
          end
        else
          if (@items[i].quality < 50)
            @items[i].quality = @items[i].quality + 1
          end
        end
      end
    end
  end
end