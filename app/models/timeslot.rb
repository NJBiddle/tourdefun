class Timeslot < ActiveRecord::Base
  has_many :artists
  belongs_to :venue

  default_scope { order('start ASC') }
  scope :upcoming, -> { where("start > ?", Date.today.beginning_of_year) }

  just_define_datetime_picker :start
  just_define_datetime_picker :end

  def self.first_show_time
    shows = upcoming
    if shows.any?
      shows.first.start.strftime('%B %d, %Y')
    end
  end

end
