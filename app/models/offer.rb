# frozen_string_literal: true

class Offer < ApplicationRecord
  has_many :offer_targets, dependent: :destroy
end
