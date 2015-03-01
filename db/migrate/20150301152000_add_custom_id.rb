class AddCustomId < ActiveRecord::Migration
  def change
    add_column :users, :custom_id, :string

    rename_column :users, :actived_on, :activated_on
  end
end