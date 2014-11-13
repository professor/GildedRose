require './items/regular.rb'

module Items
  class Legendary < Regular

    def update
      quality_change
      sell_in
    end

  private
    def quality_change
      quality
    end
    def sell_in_change
      sell_in
    end
  end
end