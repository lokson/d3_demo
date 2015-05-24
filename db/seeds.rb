include FactoryGirl::Syntax::Methods

# role with two users
role = create :role
create_list :user, 2, role: role

# role with one user
create_list :user, 2

# role with no user
create :role

