class AddKnownWordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :known_word, :string
  end
end
