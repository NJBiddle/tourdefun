module TimeslotsHelper
  def timeslot_past(start)
    'past' if Time.now > start
  end

  def coords(timeslot)
    venue = timeslot.venue
    return unless venue.latitude and venue.longitude
    [venue.latitude, venue.longitude].join(',')
  end
end
