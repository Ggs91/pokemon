# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :pokemon do
    sequence(:number)
    name { Faker::Games::Pokemon.name }
    type_1 { Faker::Creature::Animal.name }
    type_2 {Faker::Creature::Animal.name  }
    total { rand(20..100) }
    hp { rand(20..100) }
    attack { rand(20..100) }
    defense { rand(20..100) }
    sp_attack { rand(20..100) }
    sp_defense { rand(20..100) }
    speed { rand(20..100) }
    generation { rand(1..6) }
    legendary { Faker::Boolean.boolean }
  end
end
