require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_numericality_of(:phone_number) }
    it { is_expected.to validate_length_of(:phone_number).is_at_least(10).is_at_most(15) }
  end

end
