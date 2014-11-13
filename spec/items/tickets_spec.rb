require './spec/spec_helper.rb'

RSpec.describe Items::Tickets do
  describe '#quality_change' do
    context "when sell_in date is 0" do
      it "returns a value of -1" do
        item = Items::Tickets.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
        item.sell_in = 0
        expect(item.send(:quality_change)).to eq -item.quality
      end
    end
    context "when sell_in date is between 1..5" do
      it "returns a value of 3" do
        item = Items::Tickets.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
        item.sell_in = rand(1..5)
        expect(item.send(:quality_change)).to eq 3
      end
    end
    context "when sell_in date is between 6..10" do
      it "returns a value of 2" do
        item = Items::Tickets.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
        item.sell_in = rand(6..10)
        expect(item.send(:quality_change)).to eq 2
      end
    end
  end
end