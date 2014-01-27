class Timeslot < ActiveRecord::Base
	has_many :artists
	has_one :venue
end
