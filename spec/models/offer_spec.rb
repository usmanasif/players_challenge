# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:header) }
    it { is_expected.to validate_presence_of(:points) }
    it { is_expected.to validate_presence_of(:payout) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:offer_targets).class_name('OfferTarget') }
  end
end
