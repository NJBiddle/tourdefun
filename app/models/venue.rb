class Venue < ActiveRecord::Base
  def self.this_year
    Timeslot.this_year.collect { |t| t.venue }
  end
end
