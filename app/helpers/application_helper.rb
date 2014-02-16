module ApplicationHelper
  def link_venue(venue)
    link_to venue.name, "http://maps.google.com/?q=#{venue.location.squish}"
  end
end
