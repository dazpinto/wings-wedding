class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :names
      t.boolean :coming, :default => false
      t.integer :guests, :default => 0

      t.timestamps
    end
  end
end
