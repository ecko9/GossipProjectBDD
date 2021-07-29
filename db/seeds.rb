# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'


User.destroy_all
User.reset_pk_sequence

Tag.destroy_all
Tag.reset_pk_sequence

Gossip.destroy_all
Gossip.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

JoinGossipAndTag.destroy_all
JoinGossipAndTag.reset_pk_sequence

spec = ["Null", "Cool", "Mouaismouaismouais"]

10.times do 
  u = City.create(name: Faker::Nation.capital_city, zip_code: rand(00001..99999).to_s)
end

10.times do
  u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentences(number: rand(1..5)), city_id: rand(1..10))
end

10.times do
  u = Gossip.create(title: Faker::Lorem.sentences(number: 1), content: Faker::Lorem.sentences(number: rand(1..10)), user_id: rand(1..10))
end

10.times do
  u = Tag.create(title: spec.sample)
end

10.times do
  u = JoinGossipAndTag.create(tag_id: rand(1..10), gossip_id: rand(1..10))
end