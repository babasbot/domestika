FactoryBot.define do
  factory :teacher do
    email do
      Faker::Internet.email(name: name)
    end

    name do
      Faker::Name.name
    end
  end
end
