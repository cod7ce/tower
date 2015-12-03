FactoryGirl.define do
  factory :user do
    nickname { FFaker::Name.name }
    avatar   { FFaker::Avatar.image }
  end
end
