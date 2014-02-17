class TimeslotsController < ApplicationController
  def index
    @page = Page.new title: 'Shows'
    @timeslots = Timeslot.upcoming
  end
end
