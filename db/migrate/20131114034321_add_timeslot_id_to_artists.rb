class AddTimeslotIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :timeslot_id, :integer
  end
end
