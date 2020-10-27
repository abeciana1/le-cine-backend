class ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :about, :city, :state, :country, :image, :member_count, :member_capacity, :privacy, :host_id
  has_many :user_clubs
  has_many :users
  has_many :club_watchlists
  has_many :movies
  has_many :meetings
  has_one :host
end
