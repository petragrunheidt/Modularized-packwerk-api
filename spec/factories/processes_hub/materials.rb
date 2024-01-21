FactoryBot.define do
  factory :material do
    name { 'MyString' }
    description { 'MyString' }
    toxicity { 1 }
    organic { false }
    recyclable { false }
  end
end
