require './items/regular.rb'

module Items
  class Tickets < Regular

  private
    def quality_change
      case @sell_in
        when 0 then -@quality
        when (1..5) then 3
        when (6..10) then 2
        else 1
      end
    end
  end
end