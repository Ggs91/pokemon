# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.paginate(page.to_i, per_page.to_i)

    render json: @pokemons
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    render json: @pokemon
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    result = CreatePokemonService.call(pokemon_params)

    if result.success
      render json: result.pokemon, status: :created
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    result = UpdatePokemonService.call(@pokemon.id, pokemon_params)

    if result.success
      render json: result.pokemon
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    DestroyPokemonService.call(@pokemon.id)

    render status: :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total, :hp,
                                    :attack, :defense, :sp_attack, :sp_defense,
                                    :speed, :generation, :legendary)
  end

  def page
    params[:page] ||= 1
  end

  def per_page
    params[:per_page] ||= 25
  end
end
