class RemoveGenresColumnFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :genres
  end
end
