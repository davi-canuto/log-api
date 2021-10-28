# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
class LogSerializer < ActiveModel::Serializer
  attributes :id, :name
end
