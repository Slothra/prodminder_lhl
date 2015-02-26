class CreateReminders < ActiveRecord::Migration
  def up
    create_table :reminders do |r|
      r.integer :user_id
      r.integer :screening_id
      r.datetime :last_reminder
      r.datetime :next_reminder
    end
  end

  def down
    drop_table :reminders
  end
end
