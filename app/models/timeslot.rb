class Timeslot < ActiveRecord::Base
  has_many :artists
  belongs_to :venue

  default_scope { order('start ASC') }
  scope :upcoming, -> { where("start > ?", Date.today.beginning_of_year) }

end
