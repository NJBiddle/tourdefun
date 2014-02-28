class TimeslotsController < ApplicationController
  def index
    @page = Page.new title: 'Shows', subtitle: Timeslot.first_show_time
    @timeslots = Timeslot.upcoming
  end
end
