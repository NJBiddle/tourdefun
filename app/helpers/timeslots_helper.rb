module TimeslotsHelper
  def timeslot_past(start)
    'past' if Time.now > start
  end
end
