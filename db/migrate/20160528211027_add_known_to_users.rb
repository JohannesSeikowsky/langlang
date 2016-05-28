class AddKnownToUsers < ActiveRecord::Migration
  def change
    add_column :users, :known, :text
  end
end
