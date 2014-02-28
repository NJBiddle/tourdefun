class Artist < ActiveRecord::Base
  belongs_to :timeslot

  def self.playing_this_year
    Artist.all.select do |artist|
      artist.timeslot.this_year?
    end
  end
end
