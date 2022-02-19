# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :player

  OPERATING_SYSTEMS = %w[ios android].freeze

  validates :operating_system, inclusion: { in: OPERATING_SYSTEMS }
  validates :os_version, format: { with: /(\d+\.)(\d+\.)(\d+)/, message: 'Use the syntax: 1.0.0' }
  validates :locale, format: { with: /[a-z]{2}_[A-Z]{2}/, message: 'Use the syntax: fr_CA' }
end
