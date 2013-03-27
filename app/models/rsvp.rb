class Rsvp < ActiveRecord::Base
  validates :names, :presence => true
  validates :guests, :numericality => { :only_integer => true }

  validates :code, :uniqueness => true

  before_create :generate_code

  def generate_code
    generated_code = Random.new.rand(1000..9999)
    generated_code = Random.new.rand(1000..9999) until Rsvp.find_by_code(generated_code) == nil
    self.code = generated_code
  end
end
