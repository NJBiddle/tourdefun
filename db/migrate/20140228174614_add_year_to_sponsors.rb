class AddYearToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :year, :integer
  end
end
