class CreateMaterialRecyclingProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :material_recycling_processes do |t|
      t.references :material, null: false, foreign_key: true
      t.references :recycling_process, null: false, foreign_key: true

      t.timestamps
    end
  end
end
