# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:modelname) }
    it { is_expected.to validate_inclusion_of(:operating_system).in_array(Device::OPERATING_SYSTEMS) }
    it { is_expected.to validate_presence_of(:os_version) }
    it { is_expected.to allow_value('1.0.0').for(:os_version) }
    it { is_expected.not_to allow_value('invalid').for(:os_version) }

    it { is_expected.to validate_presence_of(:locale) }
    it { is_expected.to allow_value('en_US').for(:locale) }
    it { is_expected.not_to allow_value('invlalid').for(:locale) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:player).class_name('Player') }
  end
end
