class CreateItemsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.references :list, foreign_key: true
    end
  end
end
