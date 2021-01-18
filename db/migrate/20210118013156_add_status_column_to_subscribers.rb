class AddStatusColumnToSubscribers < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribers, :status, :boolean, :default => false
  end
end
