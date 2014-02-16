class Timeslot < ActiveRecord::Base
  has_many :artists
  belongs_to :venue

  scope :upcoming, -> { where("start > ?", Date.today.beginning_of_year) }
end
