# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:player) { create(:player) }
  let(:player1) { create(:player) }
  params = {
    player: {
      first_name: 'Hyman',
      last_name: 'Brakus',
      birthdate: 'Mon, 08 May 1989'.to_date,
      gender: 'male'
    }
  }
  invalid_params = {
    player: {
      first_name: nil,
      last_name: 'Brakus',
      birthdate: 'Mon, 08 May 2020'.to_date,
      gender: 'male'
    }
  }

  describe "#index" do
    before do
      get :index
    end

    it 'respond with code: 200' do
      expect(response.code).to eq('200')
    end
  end

  describe "#new" do
    before do
      get :new
    end

    it 'respond with code: 200' do
      expect(response.code).to eq('200')
    end

    # it 'render player new' do
    #   expect(player).to render_template('players/new')
    #   expect(assigns(:player)).to be_a_new(Player)
    # end
  end

  describe "#edit" do
    before do
      get :edit, params: { id: player.id }
    end

    it 'respond with code: 200' do
      expect(response.code).to eq('200')
    end
end

  describe "#create" do
    context "with valid data" do
      before do
        post :create, params: params
      end

      it 'should create the player successfully' do
        expect(flash[:notice]).to eq('player is created successfully')
        expect{ post :create, params: params }.to change{ Player.count }.by(1)
        expect(response.code).to eq('302')
      end
    end

    context "with invalid data" do
      before do
        post :create, params: invalid_params
      end

      it 'should not create the player successfully' do
        expect(flash[:alert]).to eq('Unable to create player')
        expect{ post :create, params: invalid_params }.to change{ Player.count }.by(0)
        expect(response.code).to eq('200')
      end
    end
  end

  describe "#update" do
    context "with valid data" do
      before do
        put :update, params: { id: player.id }.merge(params)
      end

      it 'should update the player successfully' do
        expect(flash[:notice]).to eq('player is updated successfully')
        expect(player.reload.first_name).to eq 'Hyman'
        expect(response.code).to eq('302')
      end
    end

    context "with invalid data" do
      before do
        put :update, params: {id: player.id}.merge(invalid_params)
      end

      it 'should not update the player successfully' do
        expect(flash[:alert]).to eq('Unable to update player')
        expect(response.code).to eq('200')
      end
    end
  end

  describe "#destroy" do
    context "with valid data" do
      before do
        delete :destroy, params: { id: player.id }
      end

      it 'should destroy the player successfully' do
        expect(flash[:notice]).to eq('player is deleted successfully')
        expect(response.code).to eq('302')
      end
    end
  end
end
