# frozen_string_literal: true

class UpdatePokemonService < BaseService
  include BooleanCastingHelper

  def initialize(pokemon_id, pokemon_params)
    @pokemon_id     = pokemon_id
    @pokemon_params = pokemon_params

    @pokemon_params[:legendary] = to_bool(@pokemon_params[:legendary])
  end

  def call
    response.pokemon = Pokemon.find(@pokemon_id)

    response.pokemon.assign_attributes(@pokemon_params)

    fail!(response.pokemon.errors.full_messages) unless response.pokemon.save
  end
end
