class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |u|
      u.integer :age
      u.string :gender
      u.string :email
      u.string :phone
      u.timestamps
    end
  end

  def down
    drop_table :users
  end
end
