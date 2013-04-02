class AddStuffToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :max_guests, :integer, :default => 1
    add_column :rsvps, :filled_in, :boolean, :default => false
    add_column :rsvps, :code, :integer
  end
end
