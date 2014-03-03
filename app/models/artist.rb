class Artist < ActiveRecord::Base
  belongs_to :timeslot

  def self.this_year
    all.select do |artist|
      timeslot = artist.timeslot
      timeslot.this_year? if timeslot
    end
  end
end
