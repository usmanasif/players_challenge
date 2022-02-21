# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:player) { create(:player, birthdate: 35.years.ago.to_date, gender: Player.genders[:male]) }
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
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'respond with code: 200' do
      get :show, params: { id: player.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    it 'respond with code: 200' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#edit' do
    it 'respond with code: 200' do
      get :edit, params: { id: player.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#search_by' do
    let!(:offer1) { create(:offer) }
    let!(:offer_target) do
      create(:offer_target, offer: offer1, operating_system: 'ios',
                            gender: OfferTarget.genders[:male],
                            minimum_os_version: '1.0.0', locale: 'en_US',
                            minimum_age: 20, maximum_age: 60)
    end

    before do
      create(:device, player:, operating_system: 'ios', os_version: '1.0.0', locale: 'en_US')
    end

    it 'respond with code: 200' do
      get :search_by, params: { offer_target_id: offer_target.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with valid data' do
      subject { post :create, params: request_params }

      it 'creates the player successfully' do
        expect { subject }.to change(Player, :count).by(1)
        expect(flash[:notice]).to eq('Player is created successfully')
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      subject { post :create, params: invalid_params }

      it 'does not create the player successfully' do
        expect { subject }.to change(Player, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'updates the player successfully' do
        put :update, params: { id: player.id }.merge(request_params)
        expect(flash[:notice]).to eq('Player is updated successfully')
        expect(player.reload.first_name).to eq 'Hyman'
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not update the player successfully' do
        put :update, params: { id: player.id }.merge(invalid_params)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'destroys the player successfully' do
        delete :destroy, params: { id: player.id }
        expect(response).to redirect_to(players_url)
        expect(flash[:notice]).to eq('Player is deleted successfully')
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not destroy the player successfully' do
        allow_any_instance_of(Player).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: player.id }
        expect(response).to redirect_to(players_url)
        expect(flash[:alert]).to eq('Unable to delete Player')
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
