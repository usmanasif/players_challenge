# frozen_string_literal: true

class DevicesController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def search_by
    return if params[:os_version_range].blank?

    lowaer_range, upper_range = params[:os_version_range].split('-')

    devices = Device.pluck(:os_version).map do |os|
      if Gem::Version.new(os) > Gem::Version.new(lowaer_range) && Gem::Version.new(os) < Gem::Version.new(upper_range)
        os
      end
    end.compact

    render json: devices.size, status: :ok
  end

  private

  def permitted_params
    params.require(:device).permit(:modelname, :operating_system, :os_version, :locale, :player_id)
  end
end
