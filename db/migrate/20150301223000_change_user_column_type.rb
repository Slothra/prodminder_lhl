class ChangeUserColumnType < ActiveRecord::Migration
  def change
    remove_column :sessions, :user_id
    add_column :sessions, :user_id, :string
  end
end