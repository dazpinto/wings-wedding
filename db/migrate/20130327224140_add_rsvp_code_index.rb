class AddRsvpCodeIndex < ActiveRecord::Migration
  def change
    add_index :rsvp, :code, :unique => true
  end
end
