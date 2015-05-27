class RoleSubgroup < ActiveRecord::Base
  belongs_to :role
  belongs_to :subgroup
  validates :role, :subgroup, presence: true
end