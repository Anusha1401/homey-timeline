class CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :initialize_project

  def create
    comment = @project.comments.new(comment_params)
    if comment.save
      redirect_to project_path(params[:project_id]), notice: "Comment added successfully."
    else
      redirect_to project_path(params[:project_id]), alert: "Failed to comment: #{comment.errors.full_messages.to_sentence}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def initialize_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, alert: "Project not found."
  end
end