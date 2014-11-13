require './spec/spec_helper.rb'

RSpec.describe Items::Legendary do
  describe '#quality_change' do
    it "returns nil" do
      item = Items::Legendary.new("Sulfuras, Hand of Ragnaros", 0, 80)
      expect(item.send(:quality_change)).to eq nil
    end
  end
  describe '#sell_in' do
    it "returns nil" do
      item = Items::Legendary.new("Sulfuras, Hand of Ragnaros", 0, 80)
      expect(item.send(:sell_in_change)).to eq nil
    end
  end
end