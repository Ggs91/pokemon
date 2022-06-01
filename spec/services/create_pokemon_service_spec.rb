# frozen_string_literal: true

require 'faker'
require 'rails_helper'

RSpec.describe CreatePokemonService, type: :service do
  subject { described_class.call(pokemon_attributes) }

  let(:pokemon_attributes) do
    {
      name: Faker::Games::Pokemon.name,
      type_1: Faker::Creature::Animal.name,
      type_2: Faker::Creature::Animal.name,
      total: rand(20..100),
      hp: rand(20..100),
      attack: rand(20..100),
      defense: rand(20..100),
      sp_attack: rand(20..100),
      sp_defense: rand(20..100),
      speed: rand(20..100),
      generation: rand(1..6),
      legendary: Faker::Boolean.boolean
    }
  end

  describe '.call' do
    context 'when success' do
      it { expect(subject.success).to be true }

      it { expect { subject }.to change { Pokemon.count }.by(1) }

      it 'returns the created pokemon' do
        expect(subject.pokemon.reload).to eq(Pokemon.find_by(name: pokemon_attributes[:name]))
      end
    end

    context 'when pokemon already exists' do
      before { described_class.call(pokemon_attributes) }

      it { expect(subject.success).to be false }

      it { expect { subject }.not_to change { Pokemon.count } }

      it { expect(subject.error).to be_present }
    end
  end
end
