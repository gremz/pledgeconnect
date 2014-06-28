class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :crm_id

      t.timestamps
    end
  end
end
