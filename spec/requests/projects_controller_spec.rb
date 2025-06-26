require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let!(:project) { Project.create!(name: "Test Project") }
  let!(:comment) { project.comments.create!(body: "Test comment") }
  let!(:status_change) { project.status_changes.create!(status: "In Progress") }

  describe "GET /projects" do
    it "returns a successful response and lists projects" do
      get projects_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Test Project")
    end
  end

  describe "GET /projects/:id" do
    it "returns a successful response and shows timeline items ordered by created_at" do
      get project_path(project)
      expect(response).to have_http_status(:ok)

      timeline_items = (project.comments + project.status_changes).sort_by(&:created_at)
      timeline_contents = timeline_items.map do |item|
        if item.is_a?(Comment)
          item.body
        else
          item.status
        end
      end

      timeline_contents.each do |content|
        expect(response.body).to include(content)
      end
    end
  end

  describe "POST /projects" do
    context "with valid params" do
      it "creates a new project and redirects with notice" do
        post projects_path, params: { name: "New Project" }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(Project.last.name).to eq("New Project")
      end
    end

    context "with invalid params" do
      it "redirects with alert on failure" do
        post projects_path, params: { name: "" }
        expect(response).to redirect_to(projects_path)
        follow_redirect!
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
