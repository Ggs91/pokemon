# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DestroyPokemonService, type: :service do
  subject { described_class.call(pokemon_id) }

  let!(:pokemon) { create(:pokemon) }
  let(:pokemon_id) { pokemon.id }

  describe '.call' do
    context 'when success' do
      it { expect(subject.success).to be true }

      it { expect { subject }.to change { Pokemon.count }.by(-1) }
    end
  end
end
