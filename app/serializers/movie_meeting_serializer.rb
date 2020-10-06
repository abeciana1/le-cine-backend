class MovieMeetingSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :meeting_id, :discussion, :watch_along
  has_one :movie
  has_one :meeting
end
