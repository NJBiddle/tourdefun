module ApplicationHelper
  def link_venue(venue, options = {})
    link_to venue.name, "http://maps.google.com/?q=#{venue.location.squish}", options
  end
end
