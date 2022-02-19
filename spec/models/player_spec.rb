# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:gender) }
    it { should validate_inclusion_of(:gender).in_array(['male', 'female', 'non-binary']) }
  end

  describe 'associations' do
    it { should have_one(:device).class_name('Device') }
  end
end
