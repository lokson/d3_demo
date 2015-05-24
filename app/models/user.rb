class User < ActiveRecord::Base
  belongs_to :role
  validates :name, :password, :role, presence: true
  validates :name, uniqueness: true
end