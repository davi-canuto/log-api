class LogEventSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :url, :http_method
  has_one :log
end
