# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:modelname) }
    it { should validate_presence_of(:operating_system) }
    it { should validate_inclusion_of(:operating_system).in_array(['ios', 'android']) }
    it { should validate_presence_of(:os_version) }
    it { should allow_value("1.0.0").for(:os_version) }
    it { should_not allow_value("invalid").for(:os_version) }

    it { should validate_presence_of(:locale) }
    it { should allow_value("en_US").for(:locale) }
    it { should_not allow_value("invlalid").for(:locale) }

    it { should validate_presence_of(:player) }
  end

  describe 'associations' do
    it { should belong_to(:player).class_name('Player') }
  end
end
