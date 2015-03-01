class ChangeSessionsTable < ActiveRecord::Migration
  def change
    remove_column :sessions, :hash1
    remove_column :sessions, :hash2
    remove_column :sessions, :hash3
    add_column :sessions, :custom_session_id, :string
  end
end