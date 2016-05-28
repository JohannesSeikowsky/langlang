class RemoveKnownWordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :known_word, :string
  end
end
