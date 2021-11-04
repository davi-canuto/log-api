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

  def self.task_qtd_request_types
    arr_methods = Array.new
    Log.last.log_events.each do |line|
      arr_methods.append(line.http_method)
    end

    return arr_methods.uniq.length
  end

  def self.task_qtd_unique_users
    unique_users = Array.new
    arr_users = Array.new
    Log.last.log_events.each do |line|
      arr_users.append(line.ip_address)
    end

    freq = arr_users.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    freq.each do |key,value|
      if value == 1
        unique_users.append(key)
      end
    end
    return unique_users.length
  end

  def self.task_most_accessed_ip
    arr_users = Array.new
    Log.last.log_events.each do |line|
      arr_users.append(line.ip_address)
    end

    freq = arr_users.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr_users.max_by { |v| freq[v] }
  end

  def self.task_most_accessed_url
    arr_url = Array.new
    Log.last.log_events.each do |line|
      arr_url.append(line.url)
    end

    freq = arr_url.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr_url.max_by { |v| freq[v] }
  end
end
