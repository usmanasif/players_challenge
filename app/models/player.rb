# frozen_string_literal: true

class Player < ApplicationRecord
  GENDER_OPTIONS = %w[male female non-binary].freeze

  has_one :device, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, inclusion: { in: GENDER_OPTIONS }
  validates :birthdate, presence: true
  validate :validate_birthdate

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def validate_birthdate
    return if birthdate.nil? || birthdate < 13.years.ago.to_date

    errors.add(:base, 'Player should be over 13 years.')
  end
end
