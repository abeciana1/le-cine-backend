class CreateSubscribers < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :phone_number
      t.string :email_address, :default => ""
      t.timestamps
    end
  end
end
