class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :link, :title, :about, :excerpt, :club_id
  has_many :movie_meetings
  has_many :movies
  has_one :club
end
