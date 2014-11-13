require './items/regular'

module Items
  class Conjured < Regular

  private
    def quality_change
      -2
    end
  end
end