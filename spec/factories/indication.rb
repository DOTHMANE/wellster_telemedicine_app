FactoryBot.define do
  factory :indication do
    name { Faker::Name.unique.name }
  end
end
