require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:status_changes) }
  end

  describe 'validations' do
    it 'can be created with valid attributes' do
      project = Project.new(name: "Test Project")
      expect(project).to be_valid
    end
  end
end