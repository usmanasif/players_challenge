# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferTarget, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:minimum_age) }
    it { is_expected.to validate_presence_of(:maximum_age) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_inclusion_of(:operating_system).in_array(Device::OPERATING_SYSTEMS) }
    it { is_expected.to validate_presence_of(:minimum_os_version) }
    it { is_expected.to validate_presence_of(:locale) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:offer).class_name('Offer') }
  end

  describe 'offer_target_methods' do
    let(:offer_target) { build(:offer_target) }

    describe '#to_s' do
      it 'returns attribute string for offer target' do
        expect(offer_target.to_s).to eq("#{offer_target.minimum_age}-#{offer_target.maximum_age}," \
                                        " #{offer_target.gender}, #{offer_target.operating_system}," \
                                        " #{offer_target.minimum_os_version}, #{offer_target.locale}")
      end
    end

    describe '#min_birtdate' do
      it 'returns min birtdate of offer target' do
        expect(offer_target.min_birtdate).to eq(offer_target.minimum_age.years.ago.to_date)
      end
    end

    describe '#max_birtdate' do
      it 'returns max birtdate of offer target' do
        expect(offer_target.max_birtdate).to eq(offer_target.maximum_age.years.ago.to_date)
      end
    end
  end
end
