class CreateMovieRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_records do |t|

      t.timestamps
    end
  end
end
