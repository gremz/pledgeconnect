class CreateScheduledGroups < ActiveRecord::Migration
  def change
    create_table :scheduled_groups do |t|
      t.integer :schedule_id

      t.timestamps
    end
  end
end
