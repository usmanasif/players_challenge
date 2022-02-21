# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:device).class_name('Device') }
  end

  describe 'player_methods' do
    describe '#full_name' do
      it 'returns full name of player' do
        player = described_class.new
        player.first_name = 'Hyman'
        player.last_name  = 'Brakus'
        expect(player.full_name).to eq('Hyman Brakus')
      end
    end
  end
end
