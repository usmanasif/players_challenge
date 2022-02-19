# frozen_string_literal: true

class OffersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  private

  def permitted_params
    params.require(:offer).permit(:title, :header, :description, :points, :payout)
  end
end
