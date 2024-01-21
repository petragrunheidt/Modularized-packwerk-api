class Material < ApplicationRecord
  validates :name,
            :toxicity,
            :organic,
            :recyclable,
            presence: true

  validates :name,
            uniqueness: true
end
