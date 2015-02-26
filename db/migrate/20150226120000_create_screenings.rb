class CreateScreenings < ActiveRecord::Migration
  def up
    create_table :screenings do |s|
      s.string :name
      s.string :condition_id
      s.string :gender
      s.integer :min_18_24
      s.integer :max_18_24
      s.integer :min_25_29
      s.integer :max_25_29
      s.integer :min_30_39
      s.integer :max_30_39
      s.integer :min_40_49
      s.integer :max_40_49
      s.integer :min_50_59
      s.integer :max_50_59
      s.integer :min_60_69
      s.integer :max_60_69
      s.integer :min_70_up
      s.integer :max_70_up
      s.text :exception_note
    end
  end

  def down
    drop_table :screenings
  end
end
