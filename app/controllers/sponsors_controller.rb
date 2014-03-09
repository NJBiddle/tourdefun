class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.this_year

    @platinum_sponsors = Sponsor.level('platinum').this_year
    @gold_sponsors     = Sponsor.level('gold').this_year
    @silver_sponsors   = Sponsor.level('silver').this_year
    @bronze_sponsors   = Sponsor.level('bronze').this_year
  end
end
