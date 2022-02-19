# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:header) }
    it { should validate_presence_of(:points) }
    it { should validate_presence_of(:payout) }
  end

  describe 'associations' do
    it { should have_many(:offer_targets).class_name('OfferTarget') }
  end
end
