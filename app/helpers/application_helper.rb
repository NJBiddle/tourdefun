module ApplicationHelper
  def link_venue(venue, options = {})
    link_to_map venue.name, venue, options
  end

  def link_to_map(string, resource, options = {})
    defaults = {
      target: '_blank'
    }
    link_to string, map_link(resource.location.squish), defaults.merge(options)
  end

  def map_link(location)
    "http://maps.google.com/?q=#{location}"
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
