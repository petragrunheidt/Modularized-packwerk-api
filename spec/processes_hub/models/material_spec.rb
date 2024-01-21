require 'rails_helper'

RSpec.describe Material, type: :model do
  # let(:attributes) do
  #   %i[name
  #      description
  #      toxicity
  #      organic
  #      recyclable]
  # end

  context 'validations' do
    it 'presence' do
      required_attributes = %i[name
                               toxicity
                               organic
                               recyclable]

      required_attributes.each do |attribute|
        is_expected.to validate_presence_of(attribute).on(:build)
      end
    end

    it 'uniqueness' do
      required_attributes = %i[name]

      required_attributes.each do |attribute|
        is_expected.to validate_uniqueness_of(attribute).on(:build)
      end
    end
  end
end
