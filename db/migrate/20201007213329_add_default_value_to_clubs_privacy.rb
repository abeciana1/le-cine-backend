class AddDefaultValueToClubsPrivacy < ActiveRecord::Migration[6.0]
  def change
    change_column :clubs, :privacy, :boolean, :default => false
  end
end
