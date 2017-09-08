require 'gilded_rose'

describe GildedRose do
  describe "#update" do
    before(:each) do
      @gilded_rose = GildedRose.new
      @dexterity_vest = @gilded_rose.items[0]
      @aged_brie = @gilded_rose.items[1]
      @elixir_of_mongoose = @gilded_rose.items[2]
      @sulfurus = @gilded_rose.items[3]
      @backstage_pass = @gilded_rose.items[4]
      @conjured_item = @gilded_rose.items[5]
    end

    it "lowers sell_in by 1 for standard item" do
      start_sell_ins = [@dexterity_vest, @aged_brie,  @elixir_of_mongoose].map(&:sell_in)
      @gilded_rose.update_quality
      updated_sell_ins = [@dexterity_vest, @aged_brie,  @elixir_of_mongoose].map(&:sell_in)
      expect(start_sell_ins.map { |n| n - 1}).to eq(updated_sell_ins)
    end

    it "lowers quality by 1 for standard item" do
      start_qualities = [@dexterity_vest, @elixir_of_mongoose].map(&:quality)
      @gilded_rose.update_quality
      updated_qualities = [@dexterity_vest, @elixir_of_mongoose].map(&:quality)
      expect(start_qualities.map { |n| n - 1 }).to eq(updated_qualities)
    end

    it "raises quality of aged brie by 1" do
      start_quality = @aged_brie.quality
      @gilded_rose.update_quality
      expect(@aged_brie.quality).to eq(start_quality + 1)
    end

    it "has no affect on sulfurus" do
      start_sell_in = @sulfurus.sell_in
      start_quality = @sulfurus.quality
      @gilded_rose.update_quality
      expect(@sulfurus.sell_in).to eq(start_sell_in)
      expect(@sulfurus.quality).to eq(start_quality)
    end

    it "raises quality of backstage pass (> 10 days away)" do
      start_quality = @backstage_pass.quality
      @gilded_rose.update_quality
      expect(@backstage_pass.quality).to eq(start_quality + 1)
    end

    xit "degrades quality twice as fast for conjured items" do
      start_quality = @conjured_item.quality
      @gilded_rose.update_quality
      expect(@conjured_item.quality).to eq(start_quality - 2)
    end
  end
end
