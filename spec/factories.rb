FactoryGirl.define do
  factory :user do
    role
    sequence :name, ['Lord Vader', 'Master Joda', 'Princess Leya', 'Luke Skywalker'].cycle
    password '123123123'
  end

  factory :role do
    sequence :name, ['Torture Chamber Manager', 'Jabba Motivator', 'Deathstar Plumber', 'Chewbacca Food'].cycle
  end
end