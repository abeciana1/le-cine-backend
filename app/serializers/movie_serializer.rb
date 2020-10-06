class MovieSerializer < ActiveModel::Serializer
  attributes :id, :backdrop_image, :title, :poster, :genres, :tmdb_id, :imdb_id, :trailer, :tagline, :plot, :runtime, :language, :release_date
end
