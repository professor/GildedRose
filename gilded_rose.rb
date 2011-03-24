class GildedRose

  @items = {}

  def initialize
    items << Item("+5 Dexterity Vest", 10, 20)
    items << Item("Aged Brie", 2, 0)
    items << Item("Elixir of the Mongoose", 5, 7)
    items << Item("Sulfuras, Hand of Ragnaros", 0, 80)
    items << Item("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    items << Item("Conjured Mana Cake", 3, 6)
  end

  def self.updateQuality 

    @items.each do |item|
      if ((!"Aged Brie".equals(item.getName())) && !"Backstage passes to a TAFKAL80ETC concert".equals(item.getName()))
        if (item.getQuality() > 0)
          if (!"Sulfuras, Hand of Ragnaros".equals(item.getName()))
            item.setQuality(item.getQuality() - 1);
          end
        end
      else
        if (item.getQuality() < 50)
          item.setQuality(item.getQuality() + 1);

          if ("Backstage passes to a TAFKAL80ETC concert".equals(item.getName()))
            if (item.getSellIn() < 11)
              if (item.getQuality() < 50)
                item.setQuality(item.getQuality() + 1);
              end
            end

            if (item.getSellIn() < 6)
              if (item.getQuality() < 50)
                item.setQuality(item.getQuality() + 1);
              end
            end
          end
        end
      end

      if (!"Sulfuras, Hand of Ragnaros".equals(item.getName()))
        item.setSellIn(item.getSellIn() - 1);
      end

      if (item.getSellIn() < 0)
        if (!"Aged Brie".equals(item.getName()))
          if (!"Backstage passes to a TAFKAL80ETC concert".equals(item.getName()))
            if (item.getQuality() > 0)
              if (!"Sulfuras, Hand of Ragnaros".equals(item.getName()))
                item.setQuality(item.getQuality() - 1);
              end
            end
          else
            item.setQuality(item.getQuality() - item.getQuality());
          end
        else
          if (item.getQuality() < 50)
            item.setQuality(item.getQuality() + 1);
          end
        end
      end
    end
  end
end