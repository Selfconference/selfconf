class MetricsController < ApplicationController

  def index
    @expenses = MetricType.expense.metrics.where(event_id: @event)
    @revenues = MetricType.revenue.metrics.where(event_id: @event)
    @attendees = MetricType.attendee.metrics.where(event_id: @event)
    @speakers = MetricType.speaker.metrics.where(event_id: @event)


    @expense_total = @expenses.map(&:amount).reduce(:+) || 0
    @revenue_total = @revenues.map(&:amount).reduce(:+) || 0
    @total = @revenue_total - @expense_total
  end

end
