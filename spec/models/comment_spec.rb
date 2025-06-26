require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
  end

  describe 'validations' do
    it 'can be created with valid attributes' do
      project = Project.create!(name: "Test Project")
      comment = Comment.new(project: project, body: 'testing')
      expect(comment).to be_valid
    end
  end
end
