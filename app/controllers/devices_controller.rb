# frozen_string_literal: true

class DevicesController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def index
    @resources = Device.includes(:player).page(params[:page])
  end

  def search_by
    min, max = params.require(:os_version_range).split('-')

    devices = Device.pluck(:os_version).filter do |os|
      Gem::Version.new(os) > Gem::Version.new(min) && Gem::Version.new(os) < Gem::Version.new(max)
    end

    render json: { count: devices.length }, status: :ok
  end

  private

  def permitted_params
    params.require(:device).permit(:modelname, :operating_system, :os_version, :locale, :player_id)
  end
end
