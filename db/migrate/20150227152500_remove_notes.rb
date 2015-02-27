class RemoveNotes < ActiveRecord::Migration
  def change
    remove_column :screenings, :exception_note
  end
end