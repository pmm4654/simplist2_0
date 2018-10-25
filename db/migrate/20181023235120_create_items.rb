class CreateItems < ActiveRecord::Migration[5.1]
  def up
    create_table :items do |t|
      t.string :title
      t.references :list, foreign_key: true
    end
  end

  def down
    drop_table :items
  end
end
