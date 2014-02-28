module ApplicationHelper
  def link_venue(venue, options = {})
    link_to venue.name, "http://maps.google.com/?q=#{venue.location.squish}", options
  end

  def artists_count
    Artist.count
  end

  def venues_count
    Venue.count
  end
end
