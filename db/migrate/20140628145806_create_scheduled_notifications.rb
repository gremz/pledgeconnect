class CreateScheduledNotifications < ActiveRecord::Migration
  def change
    create_table :scheduled_notifications do |t|
      t.integer :provider_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :ongoing
      t.string :frequency
      t.text :message_content

      t.timestamps
    end
  end
end
