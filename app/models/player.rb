class Player < ApplicationRecord
  GENDER_OPTIONS = ['male', 'female', 'non-binary']
  has_one :device

  # validates :birthdate, :numericality => { greater_than_or_equal_to: 13, message: 'Can`t be less than 13' }
  validates :gender, :inclusion=> { in: GENDER_OPTIONS }
end
