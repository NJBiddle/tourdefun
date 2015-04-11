class AddPublishedToTimeslot < ActiveRecord::Migration
  def change
    add_column :timeslots, :published, :boolean
  end
end
