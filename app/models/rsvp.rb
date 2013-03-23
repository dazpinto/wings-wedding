class Rsvp < ActiveRecord::Base
  validates :names, :presence => true
  validates :guests, :numericality => { :only_integer => true }
end
