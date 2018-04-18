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

  def self.attendee_gender
    find_by_name('Attendee - gender')
  end

  def self.attendee_race
    find_by_name('Attendee - race')
  end

  def self.speaker
    find_by_name('Speaker')
  end

  def self.speaker_gender
    find_by_name('Speaker - gender')
  end

  def self.speaker_race
    find_by_name('Speaker - race')
  end
end
