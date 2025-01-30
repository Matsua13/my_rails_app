class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true

  validates :completed, inclusion: { in: [true, false] }
end
