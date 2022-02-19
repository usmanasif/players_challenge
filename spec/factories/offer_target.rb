# frozen_string_literal: true

FactoryBot.define do
  factory(:offer_target) do
    minimum_age { 15 }
    maximum_age { 30 }
    gender { Faker::Gender.binary_type.downcase }
    operating_system { 'ios' }
    minimum_os_version { Faker::App.semantic_version }
    locale { 'en_US' }
    offer
  end
end
