FactoryGirl.define do
  factory :user do
    role
    sequence :name, ['Lord Vader', 'Master Joda', 'Princess Leya', 'Luke Skywalker', 'Jabba the Hut'].cycle
    sequence :logins_count, [15, 10, 20, 18, 18].cycle
    sequence :last_login_at, [1.year.ago, 1.month.ago, 1.day.ago, 1.hour.ago, 1.minute.ago].cycle
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