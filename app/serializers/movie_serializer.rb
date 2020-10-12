class MovieSerializer < ActiveModel::Serializer
  attributes :id, :backdrop_path, :title, :poster_path, :mov_id, :overview, :original_language, :release_date
end
