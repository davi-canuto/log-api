# == Schema Information
#
# Table name: infos
#
#  id            :integer          not null, primary key
#  request_types :string
#  unique_users  :string
#  most_resource :string
#  most_user     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class InfoSerializer < ActiveModel::Serializer
  attributes :id, :request_types, :unique_users, :most_resource, :most_user

end
