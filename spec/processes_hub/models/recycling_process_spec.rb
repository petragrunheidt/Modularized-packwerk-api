require 'rails_helper'

RSpec.describe RecyclingProcess, type: :model do
  # let(:attributes) do
  #   %i[name
  #      description]
  # end

  context 'validations' do
    it 'presence' do
      required_attributes = %i[name]

      required_attributes.each do |attribute|
        is_expected.to validate_presence_of(attribute).on(:create)
      end
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:material_recycling_processes) }
    it { is_expected.to have_many(:materials).through(:material_recycling_processes) }
  end
end
