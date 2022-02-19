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
      expect(response.code).to eq('200')
    end
  end

  describe '#show' do
    it 'respond with code: 200' do
      get :show, params: { id: offer.id }
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
      get :edit, params: { id: offer.id }
      expect(response.code).to eq('200')
    end
  end

  describe '#create' do
    context 'with valid data' do
      it 'should create the offer successfully' do
        post :create, params: request_params
        expect(flash[:notice]).to eq('Offer is created successfully')
        expect { post :create, params: request_params }.to change { Offer.count }.by(1)
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not create the offer successfully' do
        post :create, params: invalid_params
        expect { post :create, params: invalid_params }.to change { Offer.count }.by(0)
        expect(response.code).to eq('422')
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'should update the offer successfully' do
        put :update, params: { id: offer.id }.merge(request_params)
        expect(flash[:notice]).to eq('Offer is updated successfully')
        expect(offer.reload.title).to eq 'New Title'
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not update the offer successfully' do
        put :update, params: { id: offer.id }.merge(invalid_params)
        expect(response.code).to eq('422')
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'should destroy the offer successfully' do
        delete :destroy, params: { id: offer.id }
        expect(flash[:notice]).to eq('Offer is deleted successfully')
        expect(response.code).to eq('302')
      end
    end

    context 'with invalid data' do
      it 'should not destroy the offer successfully' do
        allow_any_instance_of(Offer).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: offer.id }
        expect(flash[:alert]).to eq('Unable to delete Offer')
        expect(response.code).to eq('302')
      end
    end
  end
end
