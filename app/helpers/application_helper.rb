module ApplicationHelper
  def link_venue(venue, options = {})
    link_map venue.name, venue, options
  end

  def link_map(string, resource, options = {})
    link_to string, "http://maps.google.com/?q=#{resource.location.squish}", options
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
