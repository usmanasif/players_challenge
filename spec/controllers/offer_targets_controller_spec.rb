# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferTargetsController, type: :controller do
  let(:offer1) { create(:offer) }
  let(:offer_target) { create(:offer_target, offer: offer1) }
  let(:request_params) do
    {
      offer_target: {
        minimum_age: 15,
        maximum_age: 30,
        gender: Faker::Gender.binary_type.downcase,
        operating_system: 'android',
        minimum_os_version: Faker::App.semantic_version,
        locale: 'en_US',
        offer_id: offer1.id
      }
    }
  end

  let(:invalid_params) do
    {
      offer_target: {
        minimum_age: nil,
        maximum_age: 30,
        gender: Faker::Gender.binary_type.downcase,
        operating_system: 'windows',
        minimum_os_version: Faker::App.semantic_version,
        locale: 'en_US',
        offer_id: offer1.id
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
      get :show, params: { id: offer_target.id }
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
      get :edit, params: { id: offer_target.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with valid data' do
      subject { post :create, params: request_params }

      it 'creates the offer target successfully' do
        expect { subject }.to change(OfferTarget, :count).by(1)
        expect(flash[:notice]).to eq('Offer target is created successfully')
        expect(response).to redirect_to(offer_target_url(offer_target.id - 1))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      subject { post :create, params: invalid_params }

      it 'does not create the offer target successfully' do
        expect { subject }.to change(OfferTarget, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'updates the offer target successfully' do
        put :update, params: { id: offer_target.id }.merge(request_params)
        expect(flash[:notice]).to eq('Offer target is updated successfully')
        expect(offer_target.reload.operating_system).to eq 'android'
        expect(response).to redirect_to(offer_target_url(offer_target.id))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not update the offer target successfully' do
        put :update, params: { id: offer_target.id }.merge(invalid_params)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'destroys the offer target successfully' do
        delete :destroy, params: { id: offer_target.id }
        expect(flash[:notice]).to eq('Offer target is deleted successfully')
        expect(response).to redirect_to(offer_targets_url)
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not destroy the offer target successfully' do
        allow_any_instance_of(OfferTarget).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: offer_target.id }
        expect(flash[:alert]).to eq('Unable to delete Offer target')
        expect(response).to redirect_to(offer_targets_url)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
