# frozen_string_literal: true

class CreatePokemonService < BaseService
  include BooleanCastingHelper

  def initialize(pokemon_params)
    @pokemon_params = pokemon_params

    @pokemon_params[:legendary] = to_bool(@pokemon_params[:legendary])
  end

  def call
    return fail!("Pokemon already exists") if Pokemon.find_by(name: @pokemon_params[:name])

    response.pokemon = Pokemon.create(@pokemon_params)
  end
end
