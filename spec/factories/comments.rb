FactoryGirl.define do
  factory :comment do
    target  { Todo.limit(5).sample || create(:todo) }
    creator { User.limit(5).sample  || create(:user) }
    content { FFaker::Lorem.sentence }
  end
end
