# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :player

  OPERATING_SYSTEMS = %w[ios android].freeze

  validates :modelname, presence: true
  validates :operating_system, presence: true, inclusion: { in: OPERATING_SYSTEMS }
  validates :os_version, presence: true, format: { with: /(\d+\.)(\d+\.)(\d+)/, message: 'Use the syntax: 1.0.0' }
  validates :locale, presence: true, format: { with: /[a-z]{2}_[A-Z]{2}/, message: 'Use the syntax: fr_CA' }
  validates :player, presence: true
end
