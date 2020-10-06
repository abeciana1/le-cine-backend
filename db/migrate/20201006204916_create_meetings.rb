class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :date
      t.string :time
      t.string :link
      t.text :about
      t.string :excerpt
      t.integer :club_id
      t.timestamps
    end
  end
end
