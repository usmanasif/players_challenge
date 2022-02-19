class DevicesController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def search_by
    return unless params[:os_version_range].present?

    range = params[:os_version_range].split('-')
    devices = Device.pluck(:os_version).map {
      |os| os if Gem::Version.new(os) > Gem::Version.new(range[0]) && Gem::Version.new(os) < Gem::Version.new(range[1])
    }.compact
    render json: devices.count, status: 200
  end

  private

  def permitted_params
    params.require(:device).permit(:modelname, :operating_system, :os_version, :locale, :player_id)
  end
end
