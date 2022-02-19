# frozen_string_literal: true

class PlayersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def search_by
    players = params[:offer_target_id].present? ? filtered_players : Player.all

    render json: players, status: :ok
  end

  private

  def filtered_players
    offer_target = OfferTarget.find(params[:offer_target_id])
    Player.includes(:device)
          .where('birthdate BETWEEN ? AND ?', offer_target.max_birtdate, offer_target.min_birtdate)
          .where(gender: offer_target.gender)
          .where(devices: { operating_system: offer_target.operating_system })
          .where(devices: { os_version: offer_target.minimum_os_version })
          .where(devices: { locale: offer_target.locale })
  end

  def permitted_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
