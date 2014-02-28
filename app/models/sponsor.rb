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

  # TODO: add year to sponsors
  def self.this_year
    Sponsor.all
  end

end
