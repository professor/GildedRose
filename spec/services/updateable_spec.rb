require './spec/spec_helper.rb'

RSpec.describe Updateable do
  let(:updateable) { MockHelpers::DummyUpdateable.new }

  describe '#update' do
    it "updates the quality" do
      expect{ updateable.update }.to change { updateable.quality }
    end
    it "updates the sell in" do
      expect{ updateable.update }.to change { updateable.sell_in }
    end
  end

  describe '#update_quality' do
    it "updates the quality" do
      expect{ updateable.update }.to change { updateable.quality }
    end
  end

  describe '#update_sell_in' do
    it "updates the sell in" do
      expect{ updateable.update }.to change { updateable.sell_in }
    end
  end

  describe '#quality_change' do
    it "returns nil" do
      expect(updateable.send(:quality_change)).to be_nil
    end
  end

  describe '#sell_change' do
    it "returns a value of -1" do
      expect(updateable.send(:sell_change)).to eq -1
    end
  end

  describe '#min_value' do
    it "returns a value of 0" do
      expect(updateable.send(:min_value)).to eq 0
    end
  end

  describe '#max_value' do
    it "returns a value of 50" do
      expect(updateable.send(:max_value)).to eq 50
    end
  end

  describe '#bounded_quality' do
    it "returns a bound quality" do
      expect(updateable.send(:bounded_quality, updateable.quality)).to be_truthy
    end
  end
end