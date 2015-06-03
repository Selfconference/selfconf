class FundingMeterDecorator < Draper::Decorator
  delegate_all

  def formatted_current
    ActionController::Base.helpers.number_to_currency(current)
  end

  def formatted_goal
    ActionController::Base.helpers.number_to_currency(goal)
  end

  def percentage
    ((current / goal) * 100).to_i
  end

  def percentage_left
    100 - percentage
  end
end
