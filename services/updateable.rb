# A mixin that allows an item to be updated.
#
# updateable requires the following attributes to exists:
# :quality, :sell_in, :name

module Updateable

  def update
    update_quality
    update_sell_in
  end

  private

    def update_quality
      multiplier = @sell_in > 0 ? 1 : 2
      new_quality = quality_change.nil? ? 0 : (@quality + quality_change * multiplier)
      @quality = bounded_quality(new_quality)
    end

    def update_sell_in
      @sell_in += sell_change
    end

    def quality_change
    end

    def sell_change
      -1
    end

    def min_value
      0
    end

    def max_value
      50
    end

    def bounded_quality(value)
      [[value, min_value].max, max_value].min
    end
end