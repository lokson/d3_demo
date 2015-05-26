class View < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :roles
end