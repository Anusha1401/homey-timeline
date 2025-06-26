require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /projects/:project_id/comments" do
    let!(:project) { Project.create!(name: "Sample Project") }

    context "with valid parameters" do
      it "creates a new comment and redirects with a success notice" do
        post project_comments_path(project), params: {
          comment: { body: "This is a test comment." }
        }

        expect(response).to redirect_to(project_path(project))
        follow_redirect!
        expect(response.body).to include("Comment added successfully.")
        expect(project.comments.last.body).to eq("This is a test comment.")
      end
    end

    context "with invalid parameters (e.g., blank body)" do
      it "does not create a comment and redirects with an alert" do
        post project_comments_path(project), params: { comment: { body: "" } }
      
        expect(response).to redirect_to(project_path(project))
        follow_redirect!
        expect(flash[:alert]).to include("Failed to comment")
      end
    end

    context "with non-existent project" do
      it "redirects with a failure alert if project doesn't exist" do
        post project_comments_path(project_id: 9999), params: { comment: { body: "Test" } }
      
        expect(response).to redirect_to(projects_path)
        follow_redirect!
        expect(flash[:alert]).to eq("Project not found.")
      end
    end
  end
end
