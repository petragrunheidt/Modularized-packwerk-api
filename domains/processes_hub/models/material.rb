class Material < ApplicationRecord
  validates :name,
            :toxicity,
            presence: true
  validates :name, uniqueness: true

  has_many :material_recycling_processes
  has_many :recycling_processes, through: :material_recycling_processes

  enum toxicity: { free: 0, lethal: 10 }
end
