FactoryGirl.define do
  factory :coach do
    name 'Stevie Vines'
    password 'password'
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end
