require 'rails_helper'

RSpec.describe RecyclingCompany, type: :model do
  # let(:attributes) do
  #   %i[name
  #      registration_number
  #      description]
  # end

  context 'validations' do
    it 'presence' do
      required_attributes = %i[name registration_number]

      required_attributes.each do |attribute|
        is_expected.to validate_presence_of(attribute).on(:build)
      end
    end

    it 'uniqueness' do
      required_attributes = %i[name registration_number]

      required_attributes.each do |attribute|
        is_expected.to validate_uniqueness_of(attribute).on(:build)
      end
    end

    context 'associations' do
      it { is_expected.to have_many(:rc_users) }
    end
  end
end
