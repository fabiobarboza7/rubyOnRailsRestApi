class Todo < ApplicationRecord
  validates :title, :user, presence: true
end
