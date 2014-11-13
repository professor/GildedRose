require 'spec_helper'

module MockHelpers

  class DummyUpdateable
    include Updateable

    attr_accessor :quality, :sell_in

    def initialize
      @quality = rand(10..20)
      @sell_in = rand(5..10)
      @name = ['Item One', 'Item Two', 'Item Three', 'Item Foure'].sample
    end
  end
end