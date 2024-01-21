FactoryBot.define do
  factory :rc_user, class: 'RcUser' do
    email { Faker::Internet.email }
    role { 0 }
    password { SecureRandom.alphanumeric(8) }
    recycling_company
  end
end
