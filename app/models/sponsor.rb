class Sponsor < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  LEVELS = %w(platinum gold silver bronze)

  default_scope { order('position ASC') }

  scope :level, lambda { |level|
    where(level: LEVELS.index(level))
  }

  def self.level_from_index(i)
    LEVELS[i].capitalize if i
  end

  def self.levels_for_select
    (0...LEVELS.length).map { |i|
      [LEVELS[i].capitalize, i]
    }
  end

  def self.years_for_select
    (2010..Date.today.year).to_a.reverse
  end

  def self.this_year
    where(year: Date.today.year)
  end

  def self.for_year(year)
    where(year: year)
  end

end
