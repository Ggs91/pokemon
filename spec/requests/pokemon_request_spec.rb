# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokemonsController, type: :request do
  let(:response_body) { JSON.parse(response.body) }
  let(:pokemon) { create(:pokemon) }

  context 'GET' do
    describe '#index' do
      let!(:pokemons) { create_list(:pokemon, 5) }

      before { get pokemons_path }

      it_behaves_like 'a 200 ok status'

      describe 'response body' do
        it { expect(response_body.count).to eq(5) }

        it_behaves_like "a pokemon payload" do
          let(:pokemon_record) { pokemons.first }
          let(:pokemon_payload) { response_body.first }
        end
      end

      describe 'pagination' do
        subject { response_body.count }

        context 'when page=1&per_page=2' do
          before { get pokemons_path, params: { page: 1, per_page: 2 } }

          it { is_expected.to eq(2) }
        end

        context 'when page=2&per_page=1' do
          before { get path, params: { page: 2, per_page: 1 } }

          it { is_expected.to eq(1) }
        end
      end
    end

    describe '#show' do
      before { get pokemon_path(pokemon) }

      context 'when success' do
        it_behaves_like 'a 200 ok status'

        describe 'response body' do
          it_behaves_like "a pokemon payload" do
            let(:pokemon_record) { pokemon }
            let(:pokemon_payload) { response_body }
          end
        end
      end

      context 'when failure' do
        let(:pokemon) { double }

        it_behaves_like 'a 404 record not found status'
      end
    end
  end

  context 'POST' do
    describe '#create' do
      let(:pokemon_stubbed) { build_stubbed(:pokemon) }

      let(:pokemon_params) { { pokemon: pokemon_stubbed.attributes.except(:id, :created_at, :updated_at) } }

      before { post pokemons_path(pokemon), params: pokemon_params }

      context 'when success' do
        it_behaves_like 'a 201 created status'

        describe 'response body' do
          it_behaves_like "a pokemon payload" do
            let(:pokemon_record) { Pokemon.last }
            let(:pokemon_payload) { response_body }
          end
        end
      end

      context 'when failure' do
        let(:pokemon) { create(:pokemon) }

        let(:pokemon_params) { { pokemon: pokemon.attributes } }

        it_behaves_like 'a 422 unprocessable entity status'

        it { expect(response_body["error"]).to be_present }
      end
    end
  end

  context 'PUT' do
    describe '#update' do
      let(:pokemon_params) { { pokemon:  { name: updated_name } } }

      before { put pokemon_path(pokemon), params: pokemon_params }

      context 'when success' do
        let(:updated_name) { 'updated_name' }

        it_behaves_like 'a 200 ok status'

        describe 'response body' do
          it_behaves_like "a pokemon payload" do
            let(:pokemon_record) { pokemon.reload }
            let(:pokemon_payload) { response_body }
          end
        end
      end

      context 'when failure' do
        let(:updated_name) { nil }

        it_behaves_like 'a 422 unprocessable entity status'

        it { expect(response_body["error"]).to be_present }
      end
    end
  end

  context 'DELETE' do
    describe '#destroy' do
      before { delete pokemon_path(pokemon) }

      describe 'response body' do
        it_behaves_like 'a 200 ok status'
      end
    end
  end
end
