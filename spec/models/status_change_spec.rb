require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
  end

  describe 'validations' do
    it 'can be created with valid attributes' do
      project = Project.create!(name: "Test Project")
      status_change = StatusChange.new(project: project, status: 'In Progress')
      expect(status_change).to be_valid
    end
  end
end
