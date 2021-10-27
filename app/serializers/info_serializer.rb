class InfoSerializer < ActiveModel::Serializer
  attributes :id, :request_types, :unique_users, :most_resource, :most_user, :author

 def author
  "davi"
 end
end
