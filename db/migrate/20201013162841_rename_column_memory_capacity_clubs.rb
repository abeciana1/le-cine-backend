class RenameColumnMemoryCapacityClubs < ActiveRecord::Migration[6.0]
  def change
    rename_column :clubs, :memory_capacity, :member_capacity
  end
end
