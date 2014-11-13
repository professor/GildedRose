require './spec/spec_helper.rb'

RSpec.describe Items::AgedBrie do
  describe '#quality_change' do
    it "returns a value of 2" do
      item = Items::AgedBrie.new("Aged Brie", 2, 0)
      expect(item.send(:quality_change)).to eq 1
    end
  end
end