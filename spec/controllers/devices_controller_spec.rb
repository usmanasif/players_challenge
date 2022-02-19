# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  let(:player1) { create(:player) }
  let!(:device) { create(:device, player: player1) }
  let(:request_params) do
    {
      device: {
        modelname: device.modelname,
        operating_system: 'android',
        os_version: device.os_version,
        locale: 'en_CA',
        player_id: player1.id
      }
    }
  end

  let(:invalid_params) do
    {
      device: {
        modelname: nil,
        operating_system: 'windows',
        os_version: device.os_version,
        locale: 'en_CA',
        player_id: player1.id
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
      get :show, params: { id: device.id }
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
      get :edit, params: { id: device.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#search_by' do
    let(:device) { create(:device, player: player1) }

    it 'respond with code: 200' do
      get :search_by, params: { os_version_range: '0.0.0-12.0.0' }
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq '1'
    end
  end

  describe '#create' do
    context 'with valid data' do
      subject { post :create, params: request_params }

      it 'creates the device successfully' do
        expect { subject }.to change(Device, :count).by(1)
        expect(flash[:notice]).to eq('Device is created successfully')
        expect(response).to redirect_to(device_url(device.id + 1))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      subject { post :create, params: invalid_params }

      it 'does not create the device successfully' do
        expect { subject }.to change(Device, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    context 'with valid data' do
      it 'updates the device successfully' do
        put :update, params: { id: device.id }.merge(request_params)
        expect(flash[:notice]).to eq('Device is updated successfully')
        expect(device.reload.operating_system).to eq 'android'
        expect(response).to redirect_to(device_url(device.id))
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not update the device successfully' do
        put :update, params: { id: device.id }.merge(invalid_params)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    context 'with valid data' do
      it 'destroys the device successfully' do
        delete :destroy, params: { id: device.id }
        expect(flash[:notice]).to eq('Device is deleted successfully')
        expect(response).to redirect_to(devices_url)
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid data' do
      it 'does not destroy the device successfully' do
        allow_any_instance_of(Device).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: device.id }
        expect(flash[:alert]).to eq('Unable to delete Device')
        expect(response).to redirect_to(devices_url)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
