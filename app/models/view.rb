class View < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :roles
  has_many :view_groups
  has_many :groups, through: :view_groups
  has_many :subgroups, through: :groups
end