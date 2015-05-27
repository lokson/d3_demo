class Role < ActiveRecord::Base
  belongs_to :view
  validates :name, :view, presence: true
  validates :name, uniqueness: true

  has_many :users, dependent: :restrict_with_exception
  has_many :role_subgroups
  has_many :subgroups, through: :role_subgroups
end