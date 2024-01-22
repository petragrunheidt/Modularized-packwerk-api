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
                               toxicity]

      required_attributes.each do |attribute|
        is_expected.to validate_presence_of(attribute)
      end
    end

    it 'uniqueness' do
      required_attributes = %i[name]

      required_attributes.each do |attribute|
        is_expected.to validate_uniqueness_of(attribute)
      end
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:material_recycling_processes) }
    it { is_expected.to have_many(:recycling_processes).through(:material_recycling_processes) }
  end
end
