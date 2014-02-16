class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.upcoming
  end
end
