FactoryGirl.define do
  factory :user do
    role
    # todo try ["Lord Vader #{i}", "Master Joda #{i}", "Princess Leya #{i}", "Luke Skywalker #{i}"].cycle.with_index
    sequence :name, ['Lord Vader', 'Master Joda', 'Princess Leya', 'Luke Skywalker'].cycle
    password '123123123'
  end

  factory :role do
    view
    sequence :name, ['Torture Chamber Manager', 'Jabba Motivator', 'Deathstar Plumber', 'Chewbacca Food'].cycle
  end

  factory :view do
    sequence :name, ['Dark side', 'Darker side', 'Side with no light', 'Praga Północ side'].cycle
  end
end