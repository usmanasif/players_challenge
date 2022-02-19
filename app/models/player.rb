# frozen_string_literal: true

class Player < ApplicationRecord
  GENDER_OPTIONS = %w[male female non-binary].freeze

  has_one :device, dependent: :destroy

  # validates :birthdate, :numericality => { greater_than_or_equal_to: 13, message: 'Can`t be less than 13' }
  validates :gender, inclusion: { in: GENDER_OPTIONS }

  def full_name
    "#{first_name} #{last_name}"
  end
end
