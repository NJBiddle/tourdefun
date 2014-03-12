class AddPositionToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :position, :integer
  end
end
