class RenameHangupToDescription < ActiveRecord::Migration
  def change
    rename_column :timeslots, :hangup, :description
    change_column :timeslots, :description, :text
  end
end
