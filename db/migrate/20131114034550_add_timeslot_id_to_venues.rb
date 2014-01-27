class AddTimeslotIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :timeslot_id, :integer
  end
end
