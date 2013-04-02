class Rsvp < ActiveRecord::Base
  validates :names, :presence => true
  validates :guests, :numericality => { :only_integer => true }

  validates :code, :uniqueness => true

  before_validation :generate_code

  def generate_code
    if self.code.nil?
      generated_code = rand(36**4).to_s(36)
      generated_code = rand(36**4).to_s(36) until Rsvp.find_by_code(generated_code) == nil
      self.code = generated_code
    end

    if self.guests.nil?
      self.guests = 0
    end
  end
end
