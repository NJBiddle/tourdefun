module ApplicationHelper
  def link_venue(venue, options = {})
    link_to venue.name, "http://maps.google.com/?q=#{venue.location.squish}", options
  end

  def artists_count
    Artist.this_year.count
  end

  def venues_count
    Venue.this_year.count
  end

  def gold_sponsors
    Sponsor.level('gold').this_year
  end
end
