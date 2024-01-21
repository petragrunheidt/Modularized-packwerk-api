require 'rails_helper'

RSpec.describe MaterialRecyclingProcess, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:material) }
    it { is_expected.to belong_to(:recycling_process) }
  end
end
