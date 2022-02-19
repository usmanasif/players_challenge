# frozen_string_literal: true

class OfferTargetsController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  private

  def permitted_params
    params.require(:offer_target).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
