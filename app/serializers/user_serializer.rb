class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birthday, :image, :admin
  has_many :movies
  has_many :clubs
  has_many :host_clubs
end
