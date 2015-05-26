class Role < ActiveRecord::Base
  belongs_to :view
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users, dependent: :restrict_with_exception
end