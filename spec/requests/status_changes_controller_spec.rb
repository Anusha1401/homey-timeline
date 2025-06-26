# spec/requests/status_changes_spec.rb

require 'rails_helper'

RSpec.describe "StatusChanges", type: :request do
  let!(:project) { Project.create!(name: "Test Project") } # Adjust attributes as needed

  describe "POST /projects/:project_id/status_changes" do
    context "with valid parameters" do
      let(:valid_params) { { status_change: { status: "In Progress" } } }

      it "creates a new status change and redirects with a notice" do
        post project_status_changes_path(project), params: valid_params

        expect(response).to redirect_to(project_path(project))
        follow_redirect!

        expect(response.body).to include("Status updated successfully.")
        expect(project.status_changes.last.status).to eq("In Progress")
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { status_change: { status: "" } } }

      it "does not create a status change and redirects with an alert" do
        post project_status_changes_path(project), params: invalid_params

        expect(response).to redirect_to(project_path(project))
        follow_redirect!

        expect(response.body).to include("Failed to update status")
        expect(project.status_changes.count).to eq(0)
      end
    end

    context "with non-existent project" do
      it "redirects to projects path with alert" do
        post project_status_changes_path(project_id: 9999), params: { status_change: { status: "Completed" } }

        expect(response).to redirect_to(projects_path)
        follow_redirect!

        expect(response.body).to include("Project not found")
      end
    end
  end
end
