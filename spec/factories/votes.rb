FactoryBot.define do
  factory :vote do
    association :voter, factory: :teacher

    factory :course_vote do
      association :votable, factory: :course
    end

    factory :proposal_vote do
      association :votable, factory: :proposal
    end
  end
end
