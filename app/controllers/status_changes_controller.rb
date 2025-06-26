class StatusChangesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :initialize_project

  def create
    status_change = @project.status_changes.new(status_change_params)

    if status_change.save
      redirect_to root_path, notice: "Status updated successfully."
    else
      redirect_to root_path, alert: "Failed to update status: #{status_change.errors.full_messages.to_sentence}"
    end
  end

  private

  def status_change_params
    params.require(:status_change).permit(:status)
  end

  def initialize_project
    @project = Project.find(params[:project_id])
    if @project.blank?
      redirect_to root_path, alert: "Project not found"
    end
  end
end
