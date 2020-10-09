class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id
  has_one :user
  has_one :movie
end
