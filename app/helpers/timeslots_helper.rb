module TimeslotsHelper
  def timeslot_past(timeslot)
    'past' if Time.now > timeslot.start
  end
end
