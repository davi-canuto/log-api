class RenameMethodColumnFromLogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :logs, :method, :method_name
  end
end
