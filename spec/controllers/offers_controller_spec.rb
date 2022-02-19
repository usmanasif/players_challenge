# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  let(:offer) { create(:offer) }
  let(:request_params) do
    {
      offer: {
        title: 'New Title',
        header: Faker::Lorem.sentence(word_count: 2),
        description: Faker::Lorem.sentence,
        points: Faker::Number.number(digits: 2),
        payout: Faker::Number.number(digits: 2)
      }
    }
  end

  let(:invalid_params) do
    {
      offer: {
        title: nil,
        header: Faker::Lorem.sentence(word_count: 2),
        description: Faker::Lorem.sentence,
        points: Faker::Number.number(digits: 2),
        payout: Faker::Number.number(digits: 2)
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
      get :show, params: { id: offer.id }
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
      get :edit, params: { id: offer.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#payout_with_age_range' do
    it 'respond with code: 200' do
      get :payout_with_age_range, params: { age_range: '15-20' }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({ 'total_payout' => '0.0' })
    end
  end

  describe '#create' do
    context 'with valid data' do
      subject { post :create, params: request_params }

      it 'creates the offer successfully' do
        expect { subject }.to change(Offer, :count).by(1)
        expect(flash[:notice]).to eq('Offer is created successfully')
        expect(response).to redirect_to(offer_url(id: offer.id - 1))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      subject { post :create, params: invalid_params }

      it 'does not create the offer successfully' do
        expect { subject }.to change(Offer, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'updates the offer successfully' do
        put :update, params: { id: offer.id }.merge(request_params)
        expect(flash[:notice]).to eq('Offer is updated successfully')
        expect(offer.reload.title).to eq 'New Title'
        expect(response).to redirect_to(offer_url(offer.id))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not update the offer successfully' do
        put :update, params: { id: offer.id }.merge(invalid_params)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'destroys the offer successfully' do
        delete :destroy, params: { id: offer.id }
        expect(response).to redirect_to(offers_url)
        expect(flash[:notice]).to eq('Offer is deleted successfully')
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not destroy the offer successfully' do
        allow_any_instance_of(Offer).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: offer.id }
        expect(response).to redirect_to(offers_url)
        expect(flash[:alert]).to eq('Unable to delete Offer')
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
