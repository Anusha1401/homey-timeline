class StatusChange < ApplicationRecord
  belongs_to :project

  validates :status, presence: true, inclusion: { in: ["Not Started", "In Progress", "Review", "Completed"] }
end
