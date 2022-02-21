# frozen_string_literal: true

class Player < ApplicationRecord
  GENDER_OPTIONS = %w[male female non_binary].freeze

  has_one :device, dependent: :destroy

  enum gender: { male: 0, female: 1, non_binary: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
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
