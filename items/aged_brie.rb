require './items/regular.rb'

module Items
  class AgedBrie < Regular

  private
    def quality_change
      1
    end
  end
end