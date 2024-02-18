FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.unique.name }
    doctor
    indication
  end
end
