# frozen_string_literal: true

RSpec.shared_examples 'a pokemon payload' do

  describe 'payload' do
    it 'has a number attribute' do
      expect(pokemon_payload['id']).to eq(pokemon_record.id)
    end

    it 'has a number attribute' do
      expect(pokemon_payload['number']).to eq(pokemon_record.number)
    end

    it 'has a name attribute' do
      expect(pokemon_payload['name']).to eq(pokemon_record.name)
    end

    it 'has a type_1 attribute' do
      expect(pokemon_payload['type_1']).to eq(pokemon_record.type_1)
    end

    it 'has a type_2 attribute' do
      expect(pokemon_payload['type_2']).to eq(pokemon_record.type_2)
    end

    it 'has a total attribute' do
      expect(pokemon_payload['total']).to eq(pokemon_record.total)
    end

    it 'has a hp attribute' do
      expect(pokemon_payload['hp']).to eq(pokemon_record.hp)
    end

    it 'has a attack attribute' do
      expect(pokemon_payload['attack']).to eq(pokemon_record.attack)
    end

    it 'has a defense attribute' do
      expect(pokemon_payload['defense']).to eq(pokemon_record.defense)
    end

    it 'has a sp_attack attribute' do
      expect(pokemon_payload['sp_attack']).to eq(pokemon_record.sp_attack)
    end

    it 'has a sp_defense attribute' do
      expect(pokemon_payload['sp_defense']).to eq(pokemon_record.sp_defense)
    end

    it 'has a speed attribute' do
      expect(pokemon_payload['speed']).to eq(pokemon_record.speed)
    end

    it 'has a generation attribute' do
      expect(pokemon_payload['generation']).to eq(pokemon_record.generation)
    end

    it 'has a legendary attribute' do
      expect(pokemon_payload['legendary']).to eq(pokemon_record.legendary)
    end
  end
end
