class Device < ApplicationRecord
  belongs_to :player

  validates :operating_system, :inclusion=> { in: ['ios','android'] }
  validates :os_version, format: { with: /(\d+\.)(\d+\.)(\d+)/, message: 'Use the syntax: 1.0.0' }
  validates :locale, format: { with: /[a-z]{2}_[A-Z]{2}/, message: 'Use the syntax: fr_CA' }
end
