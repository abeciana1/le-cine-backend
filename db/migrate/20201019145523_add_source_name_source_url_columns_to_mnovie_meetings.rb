class AddSourceNameSourceUrlColumnsToMnovieMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_meetings, :source_name, :string, :default => ""
    add_column :movie_meetings, :source_url, :string, :default => ""
  end
end
