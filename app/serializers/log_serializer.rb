# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  ip_address :string
#  url        :string
#  method     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LogSerializer < ActiveModelSerializers::Model
  attributes :id, :method, :url

end
