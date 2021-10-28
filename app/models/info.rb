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
class Info < ApplicationRecord
end
