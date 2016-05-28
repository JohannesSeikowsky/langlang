class RemoveResiduals < ActiveRecord::Migration
  def change
    remove_column :users, :known, :test
    remove_column :users, :english_knowns, :text
  end
end
