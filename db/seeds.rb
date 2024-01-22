RECYCLING_DATA = {
  'Paper Recycling' => ['Paper'],
  'Plastic Reprocessing' => ['Plastic'],
  'Glass Refining' => ['Glass'],
  'Metal Smelting' => ['Metal'],
  'Cardboard Recovery' => ['Cardboard'],
  'Aluminum Melting' => ['Aluminum'],
  'Rubber Reclamation' => ['Rubber'],
  'Textile Recycling' => ['Textiles'],
  'Electronics Reprocessing' => ['Electronics'],
  'Battery Regeneration' => ['Batteries']
}

RECYCLING_DATA.each do |process_name, materials|
  process = FactoryBot.create(:recycling_process, name: process_name)

  materials.each do |material_name|
    process.materials << FactoryBot.create(:material, name: material_name)
  end
end
