class PlayersFilter
  attr_accessor :offer_target_id

  def initialize(offer_target_id)
    @offer_target_id = offer_target_id
  end

  def filter
    filtered_players
  end

  private

  def filtered_players
    offer_target = OfferTarget.find(offer_target_id)
    Player.includes(:device)
          .where('birthdate BETWEEN ? AND ?', offer_target.max_birtdate, offer_target.min_birtdate)
          .where(gender: offer_target.gender)
          .where(devices: { operating_system: offer_target.operating_system })
          .where(devices: { os_version: offer_target.minimum_os_version })
          .where(devices: { locale: offer_target.locale })
  end
end
