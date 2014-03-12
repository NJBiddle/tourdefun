class AddPositionToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :postition, :integer
  end
end
