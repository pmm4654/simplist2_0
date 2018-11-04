class CreateRegisteredSites < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_sites do |t|
      t.string :site_url
      t.references :user, foreign_key: true
      t.string :api_secret
      t.timestamps
    end
  end
end
