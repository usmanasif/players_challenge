# frozen_string_literal: true

FactoryBot.define do
  factory(:player) do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.in_date_period(year: 1980) }
    gender { Faker::Gender.binary_type.downcase }
  end
end
