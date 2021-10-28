class CreateLogEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :log_events do |t|
      t.references :log, null: false, foreign_key: true
      t.string :ip_address
      t.string :url
      t.string :http_method

      t.timestamps
    end
  end
end
