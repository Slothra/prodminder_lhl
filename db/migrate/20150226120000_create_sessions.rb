class CreateSessions
  def up
    create_table :sessions do |s|
      s.boolean :logged_in
      s.integer :user_id
      s.string :hash1
      s.string :hash2
      s.string :hash3
      s.timestamps
    end
  end

  def down
    drop_table :sessions
  end
end
