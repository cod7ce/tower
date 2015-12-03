FactoryGirl.define do
  factory :event do
    association :firer, factory: :user
    target  { Project.limit(5).sample || create(:project) }
    entity  { Project.limit(5).sample || create(:project) }
    key     { FFaker::Lorem.word.downcase }
  end
end
