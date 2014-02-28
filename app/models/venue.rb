class Venue < ActiveRecord::Base
  def self.booked_this_year
    Timeslot.current.collect { |t| t.venue }
  end
end
