FactoryGirl.define do
  factory :user do
    role
    sequence :name, ['Lord Vader', 'Master Joda', 'Princess Leya', 'Luke Skywalker'].cycle
    password '123123123'
  end

  factory :role do
    sequence :name, ['Deathstar Plumber', 'Torture Chamber Manager', 'Jabba Motivator', 'Chewbacca Food'].cycle
    view
  end

  factory :view do
    sequence :name, ['Darker side', 'Dark side', 'Side with no light', 'Praga Północ side'].cycle
  end

  factory :group do
    sequence :name, ['Evil Voice Management', 'DeathStar OS'].cycle
  end

  factory :subgroup do
    group
    sequence :name, ['Destroy', 'Melt', 'Axe', 'Nullify', 'Torpedo'].cycle
  end
end