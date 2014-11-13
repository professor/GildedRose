require './spec/spec_helper.rb'

RSpec.describe Items::Conjured do
  describe '#quality_change' do
    it "returns a value of -2" do
      item = Items::Conjured.new("Conjured Mana Cake", 3, 6)
      expect(item.send(:quality_change)).to eq(-2)
    end
  end
end