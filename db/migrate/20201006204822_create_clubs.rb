class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :about
      t.string :city
      t.string :state
      t.string :country
      t.string :image
      t.integer :member_count
      t.integer :memory_capacity
      t.boolean :privacy
      t.integer :host_id
      t.timestamps
    end
  end
end
