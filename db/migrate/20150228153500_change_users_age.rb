class ChangeUsersAge < ActiveRecord::Migration
  def change
    remove_column :users, :age
    add_column :users, :date_of_birth, :date
  end
end
