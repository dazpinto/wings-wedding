class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :names
      t.boolean :coming
      t.integer :guests

      t.timestamps
    end
  end
end
