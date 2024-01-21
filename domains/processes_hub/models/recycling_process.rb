class RecyclingProcess < ApplicationRecord
  validates :name, presence: true

  has_many :material_recycling_processes
  has_many :materials, through: :material_recycling_processes

  accepts_nested_attributes_for :material_recycling_processes
end
