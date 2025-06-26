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
end