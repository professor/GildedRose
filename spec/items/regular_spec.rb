require './spec/spec_helper.rb'

RSpec.describe Items::Regular do
  describe '#update' do
    it "expects to receive update" do
      item = Items::Regular.new("+5 Dexterity Vest", 10, 20)
      expect(item).to receive(:update)
      item.update
    end
  end
  describe '#quality_change' do
    it "returns a value of -1" do
      item = Items::Regular.new("+5 Dexterity Vest", 10, 20)
      expect(item.send(:quality_change)).to eq -1
    end
  end
end