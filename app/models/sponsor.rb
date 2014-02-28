class Sponsor < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  LEVELS = %w(gold silver bronze)

  scope :level, lambda { |level|
    where(level: LEVELS.index(level))
  }

  def self.levels_for_select
    (0...LEVELS.length).map { |i|
      [LEVELS[i].capitalize, i]
    }
  end

  def self.years_for_select
    (2010..Date.today.year).to_a.reverse
  end

  def self.this_year
    Sponsor.where(year: Date.today.year)
  end

end
