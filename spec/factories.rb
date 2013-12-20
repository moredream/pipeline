FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar00"
    password_confirmation "foobar00"

  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end
