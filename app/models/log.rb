# == Schema Information
#
# Table name: logs
#
#  id          :integer          not null, primary key
#  ip_address  :string
#  url         :string
#  method_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Log < ApplicationRecord
  validates :ip_address, :url, :method_name, presence: true
end
