class Venue < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode

  def self.this_year
    Timeslot.this_year.collect { |t| t.venue }
  end
end
