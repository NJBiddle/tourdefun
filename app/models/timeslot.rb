class Timeslot < ActiveRecord::Base
	has_many :artists
	belongs_to :venue
end
