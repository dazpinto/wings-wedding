class CreateSongRequests < ActiveRecord::Migration
  def change
    create_table :song_requests do |t|
      t.string :artist
      t.string :title
      t.string :suggested_by

      t.timestamps
    end
  end
end
