class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :request_types
      t.string :unique_users
      t.string :most_resource
      t.string :most_user

      t.timestamps
    end
  end
end
