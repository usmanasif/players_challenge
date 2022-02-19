# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferTarget, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:minimum_age) }
    it { should validate_presence_of(:maximum_age) }
    it { should validate_presence_of(:gender) }
    it { should validate_inclusion_of(:gender).in_array(['male', 'female', 'non-binary']) }
    it { should validate_presence_of(:operating_system) }
    it { should validate_presence_of(:minimum_os_version) }
    it { should validate_presence_of(:locale) }
    it { should validate_presence_of(:offer) }
  end

  describe 'associations' do
    it { should belong_to(:offer).class_name('Offer') }
  end
end
