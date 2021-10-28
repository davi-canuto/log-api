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
require "test_helper"

class LogEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
