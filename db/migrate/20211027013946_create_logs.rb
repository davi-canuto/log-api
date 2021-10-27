class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :ip_address
      t.string :url
      t.string :method

      t.timestamps
    end
  end
end
