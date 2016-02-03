class Speaker < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :sessions
  accepts_nested_attributes_for :sessions, reject_if: :all_blank, allow_destroy: true

  default_scope -> { order("#{table_name}.name ASC") }
end
