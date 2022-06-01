# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :type_1, :type_2, :total, :hp,
             :attack, :defense, :sp_attack, :sp_defense, :speed,
             :generation, :legendary
end
