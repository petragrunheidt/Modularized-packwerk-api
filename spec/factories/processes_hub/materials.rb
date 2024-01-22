FactoryBot.define do
  factory :material do
    name { Faker::Commerce.product_name  }
    description { Faker::Lorem.paragraph }
    recyclable { [true, false].sample }
    organic { [true, false].sample }
    toxicity { rand(1..5) }
  end
end
