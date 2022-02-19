# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def random_version
  ['1.0.0', '1.1.0', '3.0.0', '5.0', '2.0.1'].sample
end

players = []

100.times do
  player = Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 13),
    gender: Player::GENDER_OPTIONS.sample
  )
  players << player
  puts "Created a player #{player.first_name}!"
end

players.each do |player|
  device = Device.create(
    modelname: Faker::Team.creature,
    operating_system: Device::OPERATING_SYSTEMS.sample,
    os_version: random_version,
    locale: %w[fr_CA en_US].sample,
    player_id: player.id
  )
  puts "Created a device #{device.modelname}!"
end

offers = []

30.times do
  offer = Offer.create(
    title: Faker::Movie.title,
    header: Faker::Movie.title,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    points: Faker::Number.between(from: 1, to: 100),
    payout: Faker::Number.between(from: 500, to: 1000)
  )

  offers << offer

  puts "Created an offer #{offer.title}!"
end

offers.each do |offer|
  [1, 2, 3, 4, 5].sample.times do
    OfferTarget.create(
      offer_id: offer.id,
      minimum_age: Faker::Number.between(from: 10, to: 30),
      maximum_age: Faker::Number.between(from: 40, to: 70),
      gender: Player::GENDER_OPTIONS.sample,
      operating_system: Device::OPERATING_SYSTEMS.sample,
      minimum_os_version: random_version,
      locale: %w[fr_CA en_US].sample
    )
    puts 'OfferTarget created!'
  end
end
