class AddEnglishKnownsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :english_knowns, :text
  end
end
