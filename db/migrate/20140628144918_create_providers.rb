class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.text :token
      t.text :social_data

      t.timestamps
    end
  end
end
