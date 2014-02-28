module ApplicationHelper
  def link_venue(venue, options = {})
    link_to venue.name, "http://maps.google.com/?q=#{venue.location.squish}", options
  end

  def artists_count
    Artist.playing_this_year.count
  end

  def venues_count
    Venue.booked_this_year.count
  end
end
