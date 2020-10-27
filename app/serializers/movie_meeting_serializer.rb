class MovieMeetingSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :meeting_id, :discussion, :watch_along, :source_name, :source_url, :created_at
  has_one :movie
  has_one :meeting
end
