include FactoryGirl::Syntax::Methods

view = create :view

# role with two users
role = create :role, view: view
user = create :user, role: role
create :user, role: role

# new set: user, role and view
create :user

# role with no user
create :role, view: view

