# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
class Log < ApplicationRecord

  has_many :log_events, dependent: :destroy


  after_create :plot_log_events

  def plot_log_events
    # if file_line = self.file.readline
    #   file_line.each do |line|
    #     regex = /\A(?<ip>\S+) \S+ \S+ \[(?<time>[^\]]+)\] "(?<method_line>GET|POST) (?<url_line>\S+) \S+?" (?<status>\d+) (?<bytes>\S+)/
    #     if parts = regex.match(line)
    #     self.log_events.create!(
    #       ip_address: parts[:ip],
    #       url: parts[:url_line],
    #       http_method: parts[:method_line]
    #     )
    #     end
    #   end
    # end
  end
end
