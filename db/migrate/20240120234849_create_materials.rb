class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.integer :toxicity, default: 0
      t.boolean :organic
      t.boolean :recyclable

      t.timestamps
    end
  end
end
