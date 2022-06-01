# frozen_string_literal: true

class DestroyPokemonService < BaseService
  def initialize(pokemon_id)
    @pokemon_id = pokemon_id
  end

  def call
    pokemon = Pokemon.find(@pokemon_id)

    pokemon.destroy
  end
end
