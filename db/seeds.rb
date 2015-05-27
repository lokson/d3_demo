include FactoryGirl::Syntax::Methods

create :user
a_user = User.last
a_role = Role.last
a_view = View.last
create :subgroup
a_group = Group.last
a_subgroup = Subgroup.last
a_view.groups << a_group

create :user
b_user = User.last
b_role = Role.last
b_view = View.last
create :subgroup
b_group = Group.last
b_subgroup = Subgroup.last
b_view.groups << b_group

a_view.groups << b_group
a_role.subgroups << a_subgroup
a_role.subgroups << b_subgroup
c_user = create :user, role: a_role
c_role = create :role, view: a_view
c_subgroup = create :subgroup, group: a_group
