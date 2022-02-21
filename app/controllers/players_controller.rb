# frozen_string_literal: true

class PlayersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def search_by
    players = params[:offer_target_id].present? ? PlayersFilter.new(params[:offer_target_id]).filter : Player.all

    render json: players, status: :ok
  end

  private

  def permitted_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
