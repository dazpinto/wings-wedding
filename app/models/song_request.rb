class SongRequest < ActiveRecord::Base
  validates :artist, :title, :presence => true
end
