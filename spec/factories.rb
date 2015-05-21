FactoryGirl.define do
  factory :user do
    sequence :name, ['Lord Vader', 'Luke Skywalker', 'Master Joda', 'Han Solo', 'Princess Leya'].cycle
  end

  factory :role do
    sequence :name, ['Chief','Soldier'].cycle
  end
end