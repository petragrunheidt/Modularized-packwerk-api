FactoryBot.define do
  factory :recycle_crafters_companies_recycling_company,
          class: 'RecycleCrafters::Companies::RecyclingCompany' do
    name { 'MyString' }
    registration_number { 'MyString' }
    description { 'MyString' }
  end
end
