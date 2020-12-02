FactoryBot.define do
  factory :course do
    title do
      "#{Faker::Hipster.word} #{Faker::Hacker.ingverb}".capitalize
    end
  end
end
