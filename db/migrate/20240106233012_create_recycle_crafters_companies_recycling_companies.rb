class CreateRecycleCraftersCompaniesRecyclingCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :recycling_companies do |t|
      t.string :name
      t.string :registration_number
      t.string :description

      t.timestamps
    end
  end
end
