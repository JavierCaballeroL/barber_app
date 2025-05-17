class AddScheduledAtToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :scheduled_at, :datetime
    remove_column :appointments, :start_time, :datetime
    remove_column :appointments, :end_time, :datetime
  end
end
