class ChangeRemindersColumnType < ActiveRecord::Migration
  def change
    remove_column :reminders, :user_id
    add_column :reminders, :user_id, :string
  end
end