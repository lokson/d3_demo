class ViewGroup < ActiveRecord::Base
  belongs_to :view
  belongs_to :group
  validates :view, :group, presence: true
end