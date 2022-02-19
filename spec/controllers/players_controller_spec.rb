# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:player) { create(:player) }
  let(:request_params) do
    {
      player: {
        first_name: 'Hyman',
        last_name: 'Brakus',
        birthdate: 'Mon, 08 May 1989'.to_date,
        gender: 'male'
      }
    }
  end

  let(:invalid_params) do
    {
      player: {
        first_name: nil,
        last_name: 'Brakus',
        birthdate: 'Mon, 08 May 2020'.to_date,
        gender: 'male'
      }
    }
  end

  describe '#index' do
    it 'respond with code: 200' do
      get :index
      expect(response.code).to eq('200')
    end
  end

  describe '#show' do
    it 'respond with code: 200' do
      get :show, params: { id: player.id }
      expect(response.code).to eq('200')
    end
  end

  describe '#new' do
    it 'respond with code: 200' do
      get :new
      expect(response.code).to eq('200')
    end
  end

  describe '#edit' do
    it 'respond with code: 200' do
      get :edit, params: { id: player.id }
      expect(response.code).to eq('200')
    end
  end

  describe '#search_by' do
    let(:offer1) { create(:offer) }
    let(:offer_target) { create(:offer_target, offer: offer1) }

    it 'respond with code: 200' do
      get :search_by, params: { offer_target_id: offer_target.id }
      expect(response.code).to eq('200')
    end
  end

  describe '#create' do
    context 'with valid data' do
      it 'should create the player successfully' do
        post :create, params: request_params
        expect(flash[:notice]).to eq('Player is created successfully')
        expect { post :create, params: request_params }.to change { Player.count }.by(1)
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not create the player successfully' do
        post :create, params: invalid_params
        expect { post :create, params: invalid_params }.to change { Player.count }.by(0)
        expect(response.code).to eq('422')
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'should update the player successfully' do
        put :update, params: { id: player.id }.merge(request_params)
        expect(flash[:notice]).to eq('Player is updated successfully')
        expect(player.reload.first_name).to eq 'Hyman'
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not update the player successfully' do
        put :update, params: { id: player.id }.merge(invalid_params)
        expect(response.code).to eq('422')
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'should destroy the player successfully' do
        delete :destroy, params: { id: player.id }
        expect(flash[:notice]).to eq('Player is deleted successfully')
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not destroy the player successfully' do
        allow_any_instance_of(Player).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: player.id }
        expect(flash[:alert]).to eq('Unable to delete Player')
        expect(response.code).to eq('302')
      end
    end
  end
end
