FactoryGirl.define do
  factory :todo do
    content { FFaker::Lorem.sentence }
    project { Project.limit(5).sample || create(:project) }
    creator { project.users.sample || create(:user) }

    trait :with_handler do
      handler { project.users.sample || project.creator }
      estimated_completed_at { [1, 2, 3].sample.days.since }
    end
  end
end
