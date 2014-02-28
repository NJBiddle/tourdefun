class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.this_year
  end
end
