class CreateListsTable < ActiveRecord::Migration[5.1]
  def up
    create_table :lists do |t|
      t.string :title

      t.timestamps
    end
  end

  def down
    drop_table :lists_tables
  end

end
