class UpdateTimeslotVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :timeslot_id
    add_column :timeslots, :venue_id, :integer
  end
end
