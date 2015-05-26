class Subgroup < ActiveRecord::Base
  belongs_to :group
  validates :name, :group, presence: true
  validates :name, uniqueness: true
end