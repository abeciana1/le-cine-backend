class CreateClubWatchlists < ActiveRecord::Migration[6.0]
  def change
    create_table :club_watchlists do |t|
      t.integer :club_id
      t.integer :movie_id
      t.timestamps
    end
  end
end
