class FixLogModelColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :logs, :name, :string
    remove_column :logs, :ip_address, :string
    remove_column :logs, :url, :string
    remove_column :logs, :method_name, :string
  end
end
