class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :body
      t.string :media_url
      t.timestamps
    end
  end
end
