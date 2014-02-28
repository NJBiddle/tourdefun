class Artist < ActiveRecord::Base
  belongs_to :timeslot

  def self.this_year
    all.select do |artist|
      artist.timeslot.this_year?
    end
  end
end
