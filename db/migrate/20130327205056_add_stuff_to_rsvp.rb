class AddStuffToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :max_guests, :integer
    add_column :rsvps, :filled_in, :boolean
    add_column :rsvps, :code, :integer
  end
end
