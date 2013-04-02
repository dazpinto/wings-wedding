class ChangeCodeType < ActiveRecord::Migration
  def change
    change_column :rsvps, :code, :string
  end
end
