require './item.rb'
require './services/updateable.rb'

module Items
  class Regular < Item

    include Updateable

    def update
      update_quality
      update_sell_in
    end

  private
    def quality_change
      -1
    end
  end
end