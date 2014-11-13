require 'spec_helper'

describe Item do
  describe "#new" do
    describe "#name" do
      let(:item) { Item.new("+5 Dexterity Vest", 10, 20) }
      it "sets a value for the @name" do
        expect(item.name).to_not be_nil
      end
    end
    describe "#sell_in" do
      let(:item) { Item.new("+5 Dexterity Vest", 10, 20) }
      it "sets a value for the @sell_in" do
        expect(item.sell_in).to_not be_nil
      end
    end
    describe "#quality" do
      let(:item) { Item.new("+5 Dexterity Vest", 10, 20) }
      it "sets a value for the @quality" do
        expect(item.quality).to_not be_nil
      end
    end
  end
end