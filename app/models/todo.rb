class Todo < ApplicationRecord
  validates :title, :is_completed, presence: true
end
