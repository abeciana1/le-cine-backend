class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :body, :media_url
end
