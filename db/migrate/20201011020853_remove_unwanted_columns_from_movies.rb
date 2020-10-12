class RemoveUnwantedColumnsFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :imdb_id
    remove_column :movies, :trailer
    remove_column :movies, :tagline
    remove_column :movies, :runtime
  end
end
