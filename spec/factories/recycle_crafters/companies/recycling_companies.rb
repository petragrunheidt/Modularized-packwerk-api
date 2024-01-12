FactoryBot.define do
  factory :recycling_company, class: 'RecyclingCompany' do
    name { Faker::Coffee.unique.blend_name }
    registration_number { rand((10**9)...(10**11)) }
    description { Faker::Lorem.paragraph(sentence_count: 50) }
  end
end
