class MetricsController < ApplicationController
  def index
    metrics = @event.metrics
    @expenses = metrics.where(metric_type: MetricType.expense)
    @revenues = metrics.where(metric_type: MetricType.revenue)
    @attendees = metrics.where(metric_type: MetricType.attendee)
    @attendees_gender = metrics.where(metric_type: MetricType.attendee_gender)
    @attendees_race = metrics.where(metric_type: MetricType.attendee_race)
    @speakers = metrics.where(metric_type: MetricType.speaker)
    @speakers_gender = metrics.where(metric_type: MetricType.speaker_gender)
    @speakers_race = metrics.where(metric_type: MetricType.speaker_race)

    @expense_total = @expenses.map(&:amount).reduce(:+) || 0
    @revenue_total = @revenues.map(&:amount).reduce(:+) || 0
    @total = @revenue_total - @expense_total
  end
end
