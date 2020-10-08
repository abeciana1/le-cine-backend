class AddDefaultValueToMeetingsExcerpt < ActiveRecord::Migration[6.0]
  def change
    change_column :meetings, :excerpt, :string, :default => ""
  end
end
