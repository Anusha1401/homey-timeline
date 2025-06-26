class TimelineItemComponent < ViewComponent::Base
  def initialize(item:)
    @item = item
  end

  def type
    @item.is_a?(Comment) ? :comment : :status
  end
end