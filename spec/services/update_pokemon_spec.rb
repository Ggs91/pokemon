# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdatePokemonService, type: :service do
  subject { described_class.call(pokemon_id, pokemon_params) }

  let(:pokemon) { create(:pokemon) }
  let(:pokemon_id) { pokemon.id }
  let(:pokemon_params) { { name: name } }

  describe '.call' do
    context 'when success' do
      let(:name) { 'name_updated' }

      it { expect(subject.success).to be true }

      it { expect(subject.pokemon.name).to eq(name) }
    end

    context 'when failure' do
      let(:name) { nil }

      it { expect(subject.success).to be false }

      it { expect(subject.pokemon.reload.name).to eq(pokemon.name) }

      it { expect(subject.error).to be_present }
    end
  end
end
