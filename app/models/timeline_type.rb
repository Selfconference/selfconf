class TimelineType < ActiveRecord::Base
  EARLYBIRD_SALES_START = "Earlybird tickets go on sale".freeze
  SUBMISSIONS_START = "Call for speakers opens".freeze
  SUBMISSIONS_END = "Call for speakers closes".freeze
  SCHOLARSHIPS_START = "Scholarship applications open".freeze
  SESSIONS_PUBLISHED = "Speakers announced!".freeze
  REGULAR_SALES_START = "Earlybird sales end, Regular tickets go on sale".freeze
  SCHOLARSHIPS_END = "Scholarship applications close".freeze
  SCHOLARSHIPS_ANNOUNCE = "Scholarship winners notified".freeze
  LATE_SALES_START = "Regular sales end, Latecomer tickets go on sale".freeze
  EVENT_STARTS = "Self.conference!".freeze
end
