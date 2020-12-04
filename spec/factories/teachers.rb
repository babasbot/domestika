FactoryBot.define do
  factory :teacher do
    email do
      Faker::Internet.email(name: name)
    end

    name do
      Faker::Name.name
    end

    password do
      SecureRandom.alphanumeric(32)
    end
  end
end
