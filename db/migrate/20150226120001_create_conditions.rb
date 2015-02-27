class CreateConditions < ActiveRecord::Migration
  def up
    create_table :conditions do |c|
      c.string :name
      c.text :description
      c.string :health_authority
      c.string :url
      c.timestamp :created_at
      c.timestamp :updated_at
    end
  end

  def down
    drop_table :conditions
  end
end
