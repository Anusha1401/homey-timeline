class Project < ApplicationRecord
  has_many :comments
  has_many :status_changes

  validates :name, presence: true
end
