class SubscriberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address, :phone_number
end
