# == Schema Information
#
# Table name: log_events
#
#  id          :integer          not null, primary key
#  log_id      :integer          not null
#  ip_address  :string
#  url         :string
#  http_method :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LogEventSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :url, :http_method
  has_one :log
end
