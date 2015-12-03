FactoryGirl.define do
  factory :project do
    creator { User.limit(5).sample || create(:user) }
    team    { Team.limit(5).sample || create(:team) }
    name    { FFaker::Lorem.word }
  end
end
