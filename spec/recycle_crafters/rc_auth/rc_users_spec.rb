require 'rails_helper'

RSpec.describe RcUser, type: :model do
  # let(:attributes) do
  #   %i[email role]
  # end

  context 'validations' do
    it 'presence' do
      required_attributes = %i[email role]

      required_attributes.each do |attribute|
        is_expected.to validate_presence_of(attribute).on(:build)
      end
    end

    it 'uniqueness' do
      required_attributes = %i[email]

      required_attributes.each do |attribute|
        is_expected.to validate_uniqueness_of(attribute).on(:build)
      end
    end

    context 'associations' do
      it { is_expected.to belong_to(:recycling_company) }
    end
  end
end
