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

  has_one_attached :file

  # after_create :plot_log_events

  def plot_log_events
    if self.file.attached?
      log_file = self.file.download.split("\n")
      log_file.each do |line|
        regex = /\A(?<ip>\S+) \S+ \S+ \[(?<time>[^\]]+)\] "(?<method_line>GET|POST) (?<url_line>\S+) \S+?" (?<status>\d+) (?<bytes>\S+)/
        if parts = regex.match(line)
          self.log_events.create!(
            ip_address: parts[:ip],
            url: parts[:url_line],
            http_method: parts[:method_line]
          )
        end
      end
    end
  end

  # def plot_log_events
  #   if Log.last.file.attached?
  #     log = Log.last.file.download
  #     regex = /\A(?<ip>\S+) \S+ \S+ \[(?<time>[^\]]+)\] "(?<method_line>GET|POST) (?<url_line>\S+) \S+?" (?<status>\d+) (?<bytes>\S+)/
  #     if parts = regex.match(log)
  #       Log.log_events.create!(
  #         ip_address: parts[:ip],
  #         url: parts[:url_line],
  #         http_method: parts[:method_line]
  #       )
  #     end
  #   end
  # end

  # def plot_log_events
  #   if file_line = self.file.readline
  #     file_line.each do |line|
  #       regex = /\A(?<ip>\S+) \S+ \S+ \[(?<time>[^\]]+)\] "(?<method_line>GET|POST) (?<url_line>\S+) \S+?" (?<status>\d+) (?<bytes>\S+)/
  #       if parts = regex.match(line)
  #       self.log_events.create!(
  #         ip_address: parts[:ip],
  #         url: parts[:url_line],
  #         http_method: parts[:method_line]
  #       )
  #       end
  #     end
  #   end
  #end
end
