class ChangeColumnSubscribersDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :subscribers, :status, :boolean, :default => true
  end
end
