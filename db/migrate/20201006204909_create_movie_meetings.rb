class CreateMovieMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_meetings do |t|
      t.integer :movie_id
      t.integer :meeting_id
      t.boolean :discussion, :default => true
      t.boolean :watch_along, :default => false
      t.timestamps
    end
  end
end
