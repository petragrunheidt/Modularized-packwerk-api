class MaterialRecyclingProcess < ApplicationRecord
  belongs_to :material
  belongs_to :recycling_process
end
