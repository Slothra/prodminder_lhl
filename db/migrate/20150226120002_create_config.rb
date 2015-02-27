class CreateConfig < ActiveRecord::Migration
  def up
    create_table :configs do |c|
      c.integer :site_id
      c.string :property
      c.string :value
      c.text :description
    end
  end

  def down
    drop_table :config
  end
end
