# frozen_string_literal: true

require 'csv'
require 'open-uri'

path = Rails.root.join('db/data/pokemon.csv')

rows = CSV.read(path, headers: true)

rows.each do |row|
  pokemon_attributes = {
    number: row["#"],
    name: row["Name"],
    type_1: row["Type 1"],
    type_2: row["Type 2"],
    total: row["Total"],
    hp: row["HP"],
    attack: row["Attack"],
    defense: row["Defense"],
    sp_attack: row["Sp. Atk"],
    sp_defense: row["Sp. Def"],
    speed: row["Speed"],
    generation: row["Generation"],
    legendary: row["Legendary"]
  }

  CreatePokemonService.call(pokemon_attributes)
end
