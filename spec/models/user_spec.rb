# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_numericality_of(:phone_number) }
    it { is_expected.to validate_length_of(:phone_number).is_at_least(10).is_at_most(15) }
  end
  
  describe '#full_name' do
   let(:user) {create(:user, first_name: 'Foo', last_name: 'Bar') }

    it { expect(user.full_name).to eq('Foo Bar') }
  end

  describe '#patient?' do
    subject { user.patient? }

    # let!(:patient) { create :patient }
    # let(:user) { patient.user }

    let(:user) { create(:user) }
    let!(:patient) { create(:patient, user: user) }

    # it { expect(user.patient?).to be true }
    it { is_expected.to be true }

    context 'when user is not patient' do
      let!(:patient) { nil }
       it { is_expected.to be false}
    end
  end

  describe '#doctor?' do
    subject { user.doctor? }

    let(:user) { create(:user) }
    let!(:doctor) { create(:doctor, user: user) }
   
    it { is_expected.to be true }

    context 'when user is not patient' do
      let!(:doctor) { nil }
      
      it { is_expected.to be false}
    end
  end
end
