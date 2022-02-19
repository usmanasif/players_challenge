# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_inclusion_of(:gender).in_array(%w[male female non-binary]) }
  end

  describe 'associations' do
    it { should have_one(:device).class_name('Device') }
  end

  describe 'player_methods' do
    context '#full_name' do
      it 'should return full name of player' do
        player = Player.new
        player.first_name = 'Hyman'
        player.last_name  = 'Brakus'
        expect(player.full_name).to eq('Hyman Brakus')
      end
    end
  end
end
