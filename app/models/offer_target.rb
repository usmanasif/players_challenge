# frozen_string_literal: true

class OfferTarget < ApplicationRecord
  belongs_to :offer

  validates :gender, inclusion: { in: Player::GENDER_OPTIONS }
  validates :operating_system, inclusion: { in: Device::OPERATING_SYSTEMS }

  def to_s
    "#{minimum_age}-#{maximum_age}, #{gender}, #{operating_system}, #{minimum_os_version}, #{locale}"
  end

  def min_birtdate
    minimum_age.years.ago.to_date
  end

  def max_birtdate
    maximum_age.years.ago.to_date
  end
end
