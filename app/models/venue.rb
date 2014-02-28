class Venue < ActiveRecord::Base
  def self.this_year
    Timeslot.current.collect { |t| t.venue }
  end
end
