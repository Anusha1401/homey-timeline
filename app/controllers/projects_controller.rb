class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @timeline_items = (
      @project.comments + @project.status_changes
    ).sort_by(&:created_at)
  end

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def create
    @project = Project.new(name: params[:name])
    if @project.save
      redirect_to root_path, notice: "Project created successfully"
    else
      redirect_to projects_path, alert: "Failed to create project"
    end
  end
end