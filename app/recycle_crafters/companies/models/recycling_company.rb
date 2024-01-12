class RecyclingCompany < ApplicationRecord
  self.table_name = 'recycling_companies'

  validates :name,
            :registration_number,
            presence: true,
            uniqueness: true
end
