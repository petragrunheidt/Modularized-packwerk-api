FactoryBot.define do
  factory :recycling_process do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 50) }
  end
end
