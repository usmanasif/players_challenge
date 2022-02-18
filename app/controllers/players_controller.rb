class PlayersController < BaseController
  actions :index, :show, :new, :create, :edit, :update, :destroy

  def index
    super
    @offer_target_options = OfferTarget.all.map { |ot| [ot.to_s, ot.id] }
  end

  def search_by
    return unless params[:offer_target_id].present?

    offer_target = OfferTarget.find(params[:offer_target_id])
    players = Player.where('birthdate BETWEEN ? AND ?', offer_target.max_birtdate, offer_target.min_birtdate)

    render json: players, status: 200
  end

  private

  def permitted_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :gender)
  end
end
