class AddRegisteredSiteIdToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :registered_site, foreign_key: true
  end
end
