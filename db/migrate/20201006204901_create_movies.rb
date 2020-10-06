class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :backdrop_image
      t.string :title
      t.string :poster
      t.string :genres
      t.integer :tmdb_id
      t.string :imdb_id
      t.string :trailer
      t.string :tagline
      t.text :plot
      t.integer :runtime
      t.string :language
      t.string :release_date
      t.timestamps
    end
  end
end
