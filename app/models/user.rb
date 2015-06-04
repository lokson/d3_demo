class User < ActiveRecord::Base
  belongs_to :role
  validates :name, :password, :role, :logins_count, presence: true
  validates :name, uniqueness: true
end