FactoryGirl.define do
  factory :team do
    creator { User.limit(5).sample || create(:user) }
    name    { FFaker::Lorem.word }
  end
end
