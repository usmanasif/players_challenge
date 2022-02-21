# frozen_string_literal: true

class PlayersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def search_by
    @players = PlayersFilter.new(params[:offer_target_id]).filter

    html_response = render_to_string 'players/players', layout: false, formats: :html
    render json: { html: html_response }
  end

  private

  def permitted_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
