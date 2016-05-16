class RenamePasswordhash < ActiveRecord::Migration
  def change
    rename_column :users, :password_hash, :password_salt
  end
end
