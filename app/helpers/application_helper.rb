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

  def convert_to_url(string)
    if /^http/ =~ string
      valid_url = string
    else
      valid_url = "http://#{string}"
    end

    valid_url
  end
end
