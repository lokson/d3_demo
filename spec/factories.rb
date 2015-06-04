FactoryGirl.define do
  factory :user do
    role
    sequence :name, ['Lord Vader', 'Master Joda', 'Princess Leya', 'Luke Skywalker'].cycle
    sequence :logins_count, [66, 17, 28, 44].cycle
    sequence :last_login_at, [1.minute.ago, 17.days.ago, 3.days.ago, 2.days.ago].cycle
    sequence :created_at, [20.days.ago, 30.days.ago, 10.days.ago, 10.days.ago].cycle
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