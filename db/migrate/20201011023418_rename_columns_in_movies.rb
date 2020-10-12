class RenameColumnsInMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :backdrop_image, :backdrop_path
    rename_column :movies, :poster, :poster_path
    rename_column :movies, :plot, :overview
    rename_column :movies, :language, :original_language
    rename_column :movies, :tmdb_id, :mov_id
  end
end
