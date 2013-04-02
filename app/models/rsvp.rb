class Rsvp < ActiveRecord::Base
  validates :names, :presence => true
  validates :guests, :numericality => { 
    :only_integer => true, 
    :greater_than_or_equal_to => 0
  }

  validates :code, :uniqueness => true

  validate :guests_under_max_guests

  before_validation :generate_code
  before_validation :guests_default
  before_validation :not_coming

  def generate_code
    if self.code.nil?
      generated_code = rand(36**4).to_s(36)
      generated_code = rand(36**4).to_s(36) until Rsvp.find_by_code(generated_code) == nil
      self.code = generated_code
    end
  end

  def guests_default
    if self.guests.nil?
      self.guests = 0
    end
  end

  def not_coming
    self.guests = 0 if self.coming == false
  end

  def guests_under_max_guests
    if self.guests > self.max_guests
      errors.add(:guests, "more than your maximum allowed guests")
    end
  end
end
