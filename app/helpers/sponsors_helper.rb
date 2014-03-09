module SponsorsHelper

  def platinum_sponsors
    Sponsor.level('platinum').this_year
  end

  def gold_sponsors
    Sponsor.level('gold').this_year
  end

  def silver_sponsors
    Sponsor.level('silver').this_year
  end

  def bronze_sponsors
    Sponsor.level('bronze').this_year
  end

end
