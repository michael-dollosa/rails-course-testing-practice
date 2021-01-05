class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :int
      #first argument is name of table, name of field/column, type
  end
end
