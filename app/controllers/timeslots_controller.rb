class TimeslotsController < ApplicationController
  def index
    @page = Page.new title: 'Schedule', subtitle: Timeslot.first_show_time
    @timeslots = Timeslot.upcoming
  end
end
