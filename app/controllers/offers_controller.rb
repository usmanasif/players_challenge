# frozen_string_literal: true

class OffersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def payout_with_age_range
    min, max = params.require(:age_range).split('-').map(&:strip)
    total = OfferTarget.joins(:offer).by_age_range(min, max).sum(:payout)

    render json: { total_payout: total }, status: :ok
  end

  private

  def permitted_params
    params.require(:offer).permit(:title, :header, :description, :points, :payout)
  end
end
