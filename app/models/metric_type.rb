class MetricType < ActiveRecord::Base
  has_many :metrics

  def self.expense
    find_by_name('Expense')
  end

  def self.revenue
    find_by_name('Revenue')
  end

  def self.attendee
    find_by_name('Attendee')
  end

  def self.speaker
    find_by_name('Speaker')
  end
end
