class PlayersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def index
    super
    @offer_target_options = OfferTarget.all.map { |ot| [ot.to_s, ot.id] }
  end

  def search_by
    players = if params[:offer_target_id].present?
                offer_target = OfferTarget.find(params[:offer_target_id])
                Player.includes(:device)
                      .where('birthdate BETWEEN ? AND ?', offer_target.max_birtdate, offer_target.min_birtdate)
                      .where(gender: offer_target.gender)
                      .where(devices: { operating_system: offer_target.operating_system })
                      .where(devices: { os_version: offer_target.minimum_os_version } )
                      .where(devices: { locale: offer_target.locale })

              else
                Player.all
              end
    render json: players, status: 200
  end

  private

  def permitted_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
