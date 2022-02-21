# frozen_string_literal: true

class Offer < ApplicationRecord
  has_many :offer_targets, dependent: :destroy

  validates :title, :header, :description, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :payout, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
