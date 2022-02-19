# frozen_string_literal: true

FactoryBot.define do
  factory(:offer) do
    title { Faker::Lorem.sentence(word_count: 2) }
    header { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.sentence }
    points { Faker::Number.number(digits: 2) }
    payout { Faker::Number.number(digits: 2) }
  end
end
