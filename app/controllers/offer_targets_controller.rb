# frozen_string_literal: true

class OfferTargetsController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  private

  def permitted_params
    params.require(:offer_target).permit(:minimum_age, :maximum_age, :gender,
                                         :operating_system, :minimum_os_version, :locale, :offer_id)
  end
end
