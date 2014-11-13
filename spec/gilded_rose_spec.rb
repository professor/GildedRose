require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do

    #the reason I did this was so that I do not have to type the item names to locate them in the array for @items
    let(:regular)  { Item.new("+5 Dexterity Vest", 10, 20) }
    let(:aged_brie)  { Item.new("Aged Brie", 2, 0) }
    let(:legendary)  { Item.new("Sulfuras, Hand of Ragnaros", 0, 80) }
    let(:tickets)  { Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20) }
    let(:conjured)  { Item.new("Conjured Mana Cake", 3, 6) }

    let(:rose) { GildedRose.new }

    context "when an item is regular (+5 Dexterity, Elixir of Mongoose)" do
      it "should lower the value for item by 1" do
        item = rose.items.select { |i| i.name == regular.name }.first
        quality = item.quality
        rose.update_quality
        expect(item.quality).to eq(quality - 1)
      end

      it "should lower quality twice if sell by date passed" do
        item = rose.items.select { |i| i.name == regular.name }.first
        quality = item.quality
        item.sell_in = 0
        rose.update_quality
        expect(item.quality).to eq(quality - 2)
      end
    end

    context "when ensuring that items quality never go negative or over 50" do
      it "should never lower the quality of the item to negative" do
        item = rose.items.select { |i| i.name == regular.name }.first
        quality = item.quality
        item.quality = 0
        rose.update_quality
        expect(item.quality).to be <= 0
      end

      it "should not have a quality over 50" do
        item = rose.items.select { |i| i.name == aged_brie.name }.first
        quality = item.quality
        item.quality = 50
        rose.update_quality
        expect(item.quality).to be <= 50
      end
    end

    context "when an item is an Aged Brie" do
      it "should increase the quality if the item Age of Brie the older it gets" do
        item = rose.items.select { |i| i.name == aged_brie.name }.first
        quality = item.quality
        rose.update_quality
        expect(item.quality).to eq(quality + 1)
      end
    end


    context "when an item is legendary (Sulfuras)" do
      it "should not change the quality" do
        item = rose.items.select { |i| i.name == legendary.name }.first
        quality = item.quality
        sell_in = item.sell_in
        rose.update_quality
        expect(item.quality).to eq(quality)
        expect(item.sell_in).to eq(sell_in)
      end
      it "should not change the sell in date" do
        item = rose.items.select { |i| i.name == legendary.name }.first
        quality = item.quality
        sell_in = item.sell_in
        rose.update_quality
        expect(item.quality).to eq(quality)
        expect(item.sell_in).to eq(sell_in)
      end
    end

    context "when the item is a 'Back Stage Pass'" do
      let(:item) { rose.items.select { |i| i.name == tickets.name }.first }
      it "increases it's quality as it's sell in date approaches" do
        quality = item.quality
        rose.update_quality
        expect(item.quality).to eq(quality + 1)
      end
      it "quality increases by 2 when there are 10 days or less" do
        quality = item.quality
        item.sell_in = rand(6..10)
        rose.update_quality
        expect(item.quality).to eq(quality + 2)
      end
      it "quality increases by 3 when there are 5 days or less" do
        quality = item.quality
        item.sell_in = rand(1..5)
        rose.update_quality
        expect(item.quality).to eq(quality + 3)
      end
      it "quality drops to 0 after the sell in date (concert)" do
        quality = item.quality
        item.sell_in = 0
        rose.update_quality
        expect(item.quality).to eq(quality - quality)
      end
    end
  end
end