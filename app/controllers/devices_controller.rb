class DevicesController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  private

  def permitted_params
    params.require(:device).permit(:modelname, :operating_system, :os_version, :locale, :player_id)
  end
end
